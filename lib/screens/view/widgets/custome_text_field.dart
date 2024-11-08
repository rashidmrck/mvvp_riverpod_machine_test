import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? Function(String?)? validator;
  final String hintText;
  final String? helperText;
  final int? maxLines;
  final int? maxLength;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  const CustomTextField({
    required this.controller,
    required this.onChanged,
    this.onFieldSubmitted,
    required this.label,
    required this.hintText,
    this.maxLines = 1,
    this.maxLength = 26,
    this.helperText,
    this.validator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 5),
        TextFormField(
          onFieldSubmitted: onFieldSubmitted,
          validator: validator,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.deepOrange),
            ),
            hintText: hintText,
            helperText: helperText,
            counterText: '',
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
          ),
          maxLines: maxLines,
          onChanged: onChanged,
          maxLength: maxLength,
          controller: controller,
        ),
      ],
    );
  }
}
