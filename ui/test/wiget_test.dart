import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:ui/routes/restriction_rules_route/restriction_rules_table.dart';
import 'package:ui/services/proto/fraud-detection-service.pb.dart';

void main() {
  testWidgets('Test RestrictionRulesTable', (tester) async {
    List<RestrictionRule> rules = [
      RestrictionRule(
          id: '1',
          ruleName: 'More than 100',
          predicate: 'context.transaction.getAmount().getAmount() >= 100'),
      RestrictionRule(
          id: '2',
          ruleName: 'No RU',
          predicate: 'context.transaction.getCountry() == "RU"'),
    ];

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: Overlay(
        initialEntries: [
          OverlayEntry(
              builder: (context) => Scaffold(
                    body: SizedBox(
                      height: 1000,
                      width: 1000,
                      child: RestrictionRulesTable(
                        initialRules: rules,
                      ),
                    ),
                  ))
        ],
      ),
    ));

    //test information loaded
    expect(find.byType(PlutoGrid), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('More than 100'), findsOneWidget);
    expect(find.text('No RU'), findsOneWidget);
    expect(find.text('context.transaction.getAmount().getAmount() >= 100'),
        findsOneWidget);
    expect(
        find.text('context.transaction.getCountry() == "RU"'), findsOneWidget);
    expect(find.byIcon(Icons.add_box_rounded), findsOneWidget);
  });
}
