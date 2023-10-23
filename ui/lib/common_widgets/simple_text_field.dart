import 'package:flutter/material.dart';

class SimpleTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final EdgeInsets? childPadding;
  const SimpleTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.childPadding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: childPadding ?? EdgeInsets.zero,
      child: TextField(
        controller: controller,
        decoration:
            InputDecoration(border: const OutlineInputBorder(), hintText: hint),
      ),
    );
  }
}
