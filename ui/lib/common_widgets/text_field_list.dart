import 'package:flutter/material.dart';

class TextFieldList extends StatelessWidget {
  final List<(TextEditingController, String)> data;
  final EdgeInsets? childPadding;
  const TextFieldList({super.key, required this.data, this.childPadding});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data
          .map((pair) => Padding(
                padding: childPadding ?? EdgeInsets.zero,
                child: TextField(
                  controller: pair.$1,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(), hintText: pair.$2),
                ),
              ))
          .toList(),
    );
  }
}
