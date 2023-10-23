import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:ui/locator.dart';
import 'package:ui/services/dialog_service.dart';
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

  Future<void> _makeInitialRequest() async {
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
        PlutoColumn(
            title: 'Id',
            field: 'id',
            width: 80,
            type: PlutoColumnType.number()),
        PlutoColumn(
            title: 'Rule name',
            field: 'ruleName',
            width: 320,
            type: PlutoColumnType.text()),
        PlutoColumn(
            title: 'Predicate',
            field: 'predicate',
            width: 640,
            type: PlutoColumnType.text()),
      ];

  List<PlutoRow> _getPlutoRowsFromRules(List<RestrictionRule> rules) =>
      rules.map((rule) => _ruleToRow(rule)).toList();

  Future<void> onAddRule(BuildContext context) async {
    final rule = await locator
        .get<DialogService>()
        .showAddRestrictionRuleDialog(context);
    if (rule != null) {
      stateManager.appendRows([_ruleToRow(rule)]);
    }
  }

  Future<void> onDeleteRule(BuildContext context) async {
    final PlutoRow? row = stateManager.currentRow;
    if (row == null) {
      locator.get<DialogService>().showInfoDialog(context, 'No row selected');
      return;
    }
    if (row.cells['id'] == null) {
      locator
          .get<DialogService>()
          .showInfoDialog(context, 'Something went wrong');
      return;
    }

    //ask for confirmation
    final bool answer = await locator.get<DialogService>().showConfirmDialog(
        context, 'Are you sure you want to delete the selected row?');
    if (!answer) {
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
        locator
            .get<DialogService>()
            .showInfoDialog(context, 'An error happened: $e');
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
