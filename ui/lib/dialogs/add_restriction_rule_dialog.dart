import 'package:flutter/material.dart';
import 'package:ui/common_widgets/error_message_widget.dart';
import 'package:ui/common_widgets/text_field_list.dart';
import 'package:ui/locator.dart';
import 'package:ui/services/fraud_detect_service.dart';
import 'package:ui/services/proto/fraud-detection-service.pb.dart';

class AddRestrictionRuleDialog extends StatefulWidget {
  const AddRestrictionRuleDialog({super.key});

  @override
  State<AddRestrictionRuleDialog> createState() =>
      _AddRestrictionRuleDialogState();
}

class _AddRestrictionRuleDialogState extends State<AddRestrictionRuleDialog> {
  late final TextEditingController idController;
  late final TextEditingController ruleNameController;
  late final TextEditingController predicateController;

  bool isLoading = false;
  String errorMessage = "";

  @override
  void initState() {
    idController = TextEditingController();
    ruleNameController = TextEditingController();
    predicateController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    idController.dispose();
    ruleNameController.dispose();
    predicateController.dispose();
    super.dispose();
  }

  void _onCancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<void> _onSubmit(BuildContext context) async {
    //TODO: 3lab content use form validation
    if (idController.text.isEmpty ||
        ruleNameController.text.isEmpty ||
        predicateController.text.isEmpty) {
      setState(() => errorMessage = "No field can be empty");
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = "";
    });

    final service = locator.get<FraudDetectService>();

    //check if id is a number
    if (int.tryParse(idController.text.trim()) == null) {
      setState(() {
        isLoading = false;
        errorMessage = "Id should be a number";
      });
      return;
    }

    //TODO: move rules State to local page Provider so i don't have to send an extra request
    //send request for a list of rules
    late final RestrictionRules rules;
    try {
      rules = await service.restrictionRulesServiceClient
          .getRestrictionRules(Empty());
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = "Failed to receive data";
      });
      return;
    }

    //Check if a row with this id already exists
    if (rules.rule.map((x) => x.id).contains(idController.text.trim())) {
      setState(() {
        isLoading = false;
        errorMessage = "A row with this id already exists";
      });
      return;
    }

    //add new rule
    final idString = idController.text.trim();
    final nameString = ruleNameController.text.trim();
    final predicateString = predicateController.text.trim();
    try {
      await service.restrictionRulesServiceClient.createNewRestrictionRule(
          CreateNewRestrictionRule(
              id: idString, name: nameString, predicate: predicateString));
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = "Failed to add a new row";
      });
      return;
    }

    //close modal and return new rule
    if (context.mounted) {
      Navigator.of(context).pop(RestrictionRule(
          id: idString, ruleName: nameString, predicate: predicateString));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FractionallySizedBox(
        widthFactor: 0.65,
        heightFactor: 0.6,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              const Text(
                'Add a new restriction rule',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const Spacer(flex: 1),
              TextFieldList(
                  childPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  data: [
                    (idController, 'Id'),
                    (ruleNameController, 'Rule name'),
                    (predicateController, 'Predicate')
                  ]),
              const Spacer(flex: 1),
              isLoading ? const LinearProgressIndicator() : Container(),
              ErrorMessageWidget(
                  text: errorMessage,
                  isVisible: !isLoading && errorMessage.isNotEmpty),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(
                      onPressed: () => _onCancel(context),
                      child: const Text('Cancel')),
                  FilledButton(
                      onPressed: () => _onSubmit(context),
                      child: const Text('Submit'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
