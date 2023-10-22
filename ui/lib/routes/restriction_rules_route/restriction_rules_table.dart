import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:ui/dialogs/add_restriction_rule_dialog.dart';
import 'package:ui/dialogs/confirm_dialog.dart';
import 'package:ui/dialogs/info_dialog.dart';
import 'package:ui/locator.dart';
import 'package:ui/services/fraud_detect_service.dart';
import 'package:ui/services/proto/fraud-detection-service.pb.dart';

class RestrictionRulesTable extends StatefulWidget {
  const RestrictionRulesTable({super.key});

  @override
  State<RestrictionRulesTable> createState() => _RestrictionRulesTableState();
}

class _RestrictionRulesTableState extends State<RestrictionRulesTable> {
  late PlutoGridStateManager stateManager;
  final List<PlutoColumn> plutoColumns = [];
  List<PlutoRow> plutoRows = [];

  List<RestrictionRule> rules = [];
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    _makeInitialRequest();
    plutoColumns.addAll(_getPlutoColumns());
    super.initState();
  }

  void _makeInitialRequest() async {
    List<RestrictionRule> newRules = [];
    bool newIsError = false;
    try {
      final response = await locator
          .get<FraudDetectService>()
          .restrictionRulesServiceClient
          .getRestrictionRules(Empty());
      newRules = response.rule;
      newIsError = false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      newIsError = true;
    } finally {
      setState(() {
        rules = newRules;
        isLoading = false;
        isError = newIsError;
        if (newRules.isNotEmpty) {
          plutoRows = _getPlutoRowsFromRules(newRules);
        }
      });
    }
  }

  PlutoRow _ruleToRow(RestrictionRule rule) => PlutoRow(cells: {
        'id': PlutoCell(value: rule.id),
        'ruleName': PlutoCell(value: rule.ruleName),
        'predicate': PlutoCell(value: rule.predicate)
      });

  List<PlutoColumn> _getPlutoColumns() => [
        PlutoColumn(title: 'Id', field: 'id', type: PlutoColumnType.number()),
        PlutoColumn(
            title: 'Rule name',
            field: 'ruleName',
            type: PlutoColumnType.text()),
        PlutoColumn(
            title: 'Predicate',
            field: 'predicate',
            type: PlutoColumnType.text()),
      ];

  List<PlutoRow> _getPlutoRowsFromRules(List<RestrictionRule> rules) =>
      rules.map((rule) => _ruleToRow(rule)).toList();

  void onAddRule(BuildContext context) {
    showDialog<RestrictionRule?>(
            context: context,
            builder: (context) => const AddRestrictionRuleDialog())
        .then((RestrictionRule? rule) {
      if (rule != null) {
        stateManager.appendRows([_ruleToRow(rule)]);
      }
    });
  }

  void onDeleteRule(BuildContext context) async {
    final PlutoRow? row = stateManager.currentRow;
    if (row == null) {
      showDialog(
          context: context,
          builder: (context) => const InfoDialog(text: 'No row selected'));
      return;
    }
    if (row.cells['id'] == null) {
      showDialog(
          context: context,
          builder: (context) => const InfoDialog(text: 'Something went wrong'));
      return;
    }

    //ask for confirmation
    final bool? answer = await showDialog<bool>(
        context: context,
        builder: (context) => const ConfirmDialog(
            text: 'Are you sure you want to delete the selected row?'));
    if (answer == null || answer == false) {
      return;
    }

    //delete
    final String idToRemove = (row.cells['id']!.value as int).toString();
    try {
      await locator
          .get<FraudDetectService>()
          .restrictionRulesServiceClient
          .removeRestrictionRule(RemoveRestrictionRule(id: idToRemove));
      setState(() {
        stateManager.removeRows([row]);
      });
    } catch (e) {
      if (context.mounted) {
        showDialog(
            context: context,
            builder: (context) => InfoDialog(text: 'An error happened: $e'));
      }
    }
  }

  void _onGridChanged(PlutoGridOnChangedEvent event) {
    stateManager.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    if (isError) {
      return const Text('Error');
    }
    if (isLoading) {
      return const CircularProgressIndicator();
    }

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            //TODO: lab3 separate upper row into its own widget
            child: Row(children: [
              const Text(
                'List of restriction rules',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Tooltip(
                message: 'Add a new rule',
                child: IconButton(
                  icon: const Icon(
                    Icons.add_box_rounded,
                    color: Colors.green,
                    size: 26,
                  ),
                  onPressed: () => onAddRule(context),
                ),
              ),
              Tooltip(
                message: 'Delete selected row',
                child: IconButton(
                  icon: const Icon(
                    Icons.remove_circle_outline,
                    color: Colors.red,
                    size: 26,
                  ),
                  onPressed: () => onDeleteRule(context),
                ),
              ),
            ]),
          ),
          Expanded(
            child: PlutoGrid(
              noRowsWidget: const Text(
                "No rules yet",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              mode: PlutoGridMode.readOnly,
              columns: plutoColumns,
              rows: plutoRows,
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;
              },
              onChanged: _onGridChanged,
            ),
          )
        ],
      ),
    );
  }
}
