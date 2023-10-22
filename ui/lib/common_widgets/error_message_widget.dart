import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String text;
  final bool isVisible;
  const ErrorMessageWidget(
      {super.key, required this.text, required this.isVisible});

  @override
  Widget build(BuildContext context) {
    if (!isVisible) {
      return Container();
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 5),
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          color: Colors.red.shade200,
          border: Border.all(color: Colors.red, width: 2)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
