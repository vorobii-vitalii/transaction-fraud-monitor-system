import 'package:flutter/material.dart';
import 'package:ui/common_widgets/left_navbar.dart';
import 'package:ui/routes/restriction_rules_route/restriction_rules_table.dart';

class RestrictionRulesRoute extends StatelessWidget {
  const RestrictionRulesRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [LeftNavbar(), Expanded(child: RestrictionRulesTable())],
      ),
    );
  }
}
