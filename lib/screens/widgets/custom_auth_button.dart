
import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key, required this.nameButton, required this.onTap,
  });
final String nameButton;
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
      
        height: 43,
        decoration: BoxDecoration(
          color: Color(0xff007EDB),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(nameButton,style: TextStyle(color: Color(0xffFFFFFF),fontSize: 18,fontWeight: FontWeight.w700),),
        ),
      ),
    );
  }
}
