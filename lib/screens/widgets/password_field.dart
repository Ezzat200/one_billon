import 'package:flutter/material.dart';

class CustomAuthPasswordField extends StatefulWidget {
  const CustomAuthPasswordField({super.key, required this.fieldName});

  final String fieldName;

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
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff414141),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          obscureText: _isObscured,
          decoration: InputDecoration(
            filled: false,
            fillColor: Color(0xFFE5E5E5),
            hintStyle: TextStyle(color: Colors.grey[600]),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffE5E5E5)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Color(0xffE5E5E5), width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red),
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
          style: TextStyle(color: Colors.black),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This field cannot be empty';
            }
            return null;
          },
        ),
      ],
    );
  }
}