import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:ui/dialogs/add_restriction_rule_dialog.dart';
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

  List<RestrictionRule>? rules;
  bool isLoading = true;
  bool isError = false;

  @override
  void initState() {
    _makeRequest();
    plutoColumns.addAll(_getPlutoColumns());
    super.initState();
  }

  void _makeRequest() async {
    List<RestrictionRule>? newRules;
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
        if (newRules != null) {
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
        setState(() => plutoRows.add(_ruleToRow(rule)));
      }
    });
  }

  void _onGridChanged(PlutoGridOnChangedEvent event) {
    print(event);
    stateManager.notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    if (isError) {
      return const Text('Error');
    }
    if (isLoading) {
      return const Text('Loading');
    }
    if (rules == null) {
      return const Text('Damn rules are null');
    }

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Row(children: [
              const Text(
                'List of restriction rules',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.green,
                  size: 26,
                ),
                onPressed: () => onAddRule(context),
              )
            ]),
          ),
          Expanded(
            child: PlutoGrid(
              noRowsWidget: Container(), //TODO: Handle rules.isEmpty
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
