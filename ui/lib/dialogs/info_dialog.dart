import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  final String text;
  const InfoDialog({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FractionallySizedBox(
        widthFactor: 0.65,
        heightFactor: 0.6,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Okay'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
