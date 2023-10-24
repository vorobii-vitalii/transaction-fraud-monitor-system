import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String text;

  const ConfirmDialog({super.key, required this.text});

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilledButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Cancel'),
                  ),
                  FilledButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Confirm'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
