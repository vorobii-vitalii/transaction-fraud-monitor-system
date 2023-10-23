import 'package:flutter/material.dart';
import 'package:ui/common_widgets/left_navbar.dart';
import 'package:ui/routes/transaction_validation_route/transaction_validation_form.dart';

class TransactionValidationRoute extends StatelessWidget {
  const TransactionValidationRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [
          LeftNavbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 240),
              child: TransactionValidationForm(),
            ),
          )
        ],
      ),
    );
  }
}
