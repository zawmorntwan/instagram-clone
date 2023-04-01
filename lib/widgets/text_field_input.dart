import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    super.key,
    this.isPassword = false,
    this.isLastInput = true,
    required this.controller,
    required this.hintText,
    required this.textInputType,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isLastInput;
  final bool isPassword;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        filled: true,
        fillColor: Colors.grey,
        contentPadding: const EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      textInputAction:
          isLastInput ? TextInputAction.done : TextInputAction.next,
      obscureText: isPassword,
    );
  }
}
