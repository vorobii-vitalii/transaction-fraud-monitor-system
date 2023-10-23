import 'package:country_picker/country_picker.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:ui/common_widgets/simple_text_field.dart';
import 'package:ui/common_widgets/text_field_list.dart';
import 'package:ui/locator.dart';
import 'package:ui/services/dialog_service.dart';
import 'package:ui/services/fraud_detect_service.dart';
import 'package:ui/services/proto/fraud-detection-service.pb.dart';

class TransactionValidationForm extends StatefulWidget {
  const TransactionValidationForm({super.key});

  @override
  State<TransactionValidationForm> createState() =>
      _TransactionValidationFormState();
}

class _TransactionValidationFormState extends State<TransactionValidationForm> {
  late final TextEditingController amountController;
  late final TextEditingController currencyController;
  late final TextEditingController countryController;
  late final TextEditingController fromController;
  late final TextEditingController toController;
  String countryName = '';
  bool isLoading = false;

  @override
  void initState() {
    amountController = TextEditingController();
    currencyController =
        TextEditingController.fromValue(const TextEditingValue(text: 'USD'));
    countryController = TextEditingController();
    fromController = TextEditingController();
    toController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    currencyController.dispose();
    countryController.dispose();
    fromController.dispose();
    toController.dispose();
    super.dispose();
  }

  void onCurrencySelect(BuildContext context) {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        setState(() => currencyController.text = currency.code);
      },
    );
  }

  void onContrySelect(BuildContext context) {
    showCountryPicker(
      context: context,
      onSelect: (Country country) {
        setState(() {
          countryController.text = country.countryCode;
          countryName = country.name;
        });
      },
    );
  }

  void onShowInfoDialog(BuildContext context, String text) {
    locator.get<DialogService>().showInfoDialog(context, text);
  }

  Future<void> onValidateTransaction(BuildContext context) async {
    if (amountController.text == '' ||
        currencyController.text == '' ||
        countryController.text == '' ||
        fromController.text == '' ||
        toController.text == '') {
      onShowInfoDialog(context, 'No empty fields are allowed');
      return;
    }

    if (int.tryParse(amountController.text) == null ||
        int.tryParse(toController.text) == null ||
        int.tryParse(fromController.text) == null) {
      onShowInfoDialog(context,
          'Amount, to Id and from Id fields should have numerical values');
      return;
    }

    setState(() => isLoading = true);
    try {
      final response = await locator
          .get<FraudDetectService>()
          .transactionValidationServiceClient
          .validateTransaction(
            Transaction(
                amount: Amount(
                    amount: int.tryParse(amountController.text),
                    currency: currencyController.text),
                toAccount: toController.text,
                fromAccount: fromController.text,
                country: countryController.text),
          );
      if (context.mounted) {
        if (response.status == ValidationStatus.SUCCESS) {
          onShowInfoDialog(context, 'Successful validation');
        } else {
          onShowInfoDialog(context, 'Validation failed');
        }
      }
    } catch (e) {
      onShowInfoDialog(
          context, 'An error happened during transaction validation');
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: SimpleTextField(
                controller: amountController,
                hint: 'Amount',
                childPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            GestureDetector(
              onTap: () => onCurrencySelect(context),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: 100,
                height: 50,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      currencyController.text,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Icon(Icons.arrow_drop_down)
                  ],
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => onContrySelect(context),
          child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black54),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 4),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        countryController.text == ''
                            ? 'Sender\'s country '
                            : countryName,
                        style: TextStyle(
                            fontWeight: countryController.text == ''
                                ? FontWeight.w500
                                : FontWeight.w400,
                            fontSize: 16.5,
                            color: countryController.text == ''
                                ? Colors.black54
                                : Colors.black)),
                    const Icon(Icons.arrow_drop_down)
                  ]),
            ),
          ),
        ),
        TextFieldList(
            childPadding: const EdgeInsets.symmetric(vertical: 10),
            data: [(fromController, 'from Id'), (toController, 'to Id')]),
        Row(
          children: [
            FilledButton(
              child: const Text('Validate Transaction'),
              onPressed: () => onValidateTransaction(context),
            ),
            isLoading ? const CircularProgressIndicator() : Container()
          ],
        )
      ],
    );
  }
}
