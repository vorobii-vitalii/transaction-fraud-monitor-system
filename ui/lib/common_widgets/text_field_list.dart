import 'package:flutter/material.dart';
import 'package:ui/common_widgets/simple_text_field.dart';

class TextFieldList extends StatelessWidget {
  final List<(TextEditingController, String)> data;
  final EdgeInsets? childPadding;
  const TextFieldList({super.key, required this.data, this.childPadding});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data
          .map((pair) => SimpleTextField(
              controller: pair.$1, hint: pair.$2, childPadding: childPadding))
          .toList(),
    );
  }
}
