import 'package:flutter/material.dart';

class TextFieldNumberWidget extends StatelessWidget {
  const TextFieldNumberWidget({
    super.key,
    required this.tfPersonNumber,
  });

  final TextEditingController tfPersonNumber;

  @override
  Widget build(BuildContext context) {
    return TextField(controller: tfPersonNumber,decoration: const InputDecoration(hintText: "Kişi Tel"),);
  }
}
