import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.validator,
    this.maxLines = 1,
    this.onTap,
    this.readOnly = false,
    this.hintText,
  });

  final String fieldName;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final int maxLines;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff414141)),
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          onTap: onTap,
          readOnly: readOnly,
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFF5F5F5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFFF5F5F5), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
