import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String textFieldName;
  final String? errorText;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    required this.textFieldName,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          errorText: errorText,
          label: Text(
            textFieldName,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 2),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
