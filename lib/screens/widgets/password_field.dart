import 'package:flutter/material.dart';

class CustomAuthPasswordField extends StatefulWidget {
  const CustomAuthPasswordField({
    super.key,
    required this.fieldName,
    this.controller,
    this.validator,
  });

  final String fieldName;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  _CustomAuthPasswordFieldState createState() => _CustomAuthPasswordFieldState();
}

class _CustomAuthPasswordFieldState extends State<CustomAuthPasswordField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff414141),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return 'This field cannot be empty';
                }
                return null;
              },
          obscureText: _isObscured,
          decoration: InputDecoration(
            hintText: widget.fieldName,
            filled: false,
            fillColor: const Color(0xFFE5E5E5),
            hintStyle: TextStyle(color: Colors.grey[600]),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffE5E5E5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffE5E5E5), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.red),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey[600],
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            ),
          ),
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}
