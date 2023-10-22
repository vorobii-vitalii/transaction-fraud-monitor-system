import 'package:flutter/material.dart';
import 'package:ui/common_widgets/left_navbar.dart';

class RestrictionRulesRoute extends StatelessWidget {
  const RestrictionRulesRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const LeftNavbar(),
          Expanded(
              child: Container(
            color: Colors.blue,
          ))
        ],
      ),
    );
  }
}
