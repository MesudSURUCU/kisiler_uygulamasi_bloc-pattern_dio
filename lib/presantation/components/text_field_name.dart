import 'package:flutter/material.dart';

class TextFieldNameWidget extends StatelessWidget {
  const TextFieldNameWidget({
    super.key,
    required this.tfPersonName,
  });

  final TextEditingController tfPersonName;

  @override
  Widget build(BuildContext context) {
    return TextField(controller: tfPersonName,decoration: const InputDecoration(hintText: "Kişi Ad"),);
  }
}