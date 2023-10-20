import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  const TextBox({super.key, required this.labelText, required this.controller});

  final String labelText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: labelText,
          ),
        ));
  }
}
