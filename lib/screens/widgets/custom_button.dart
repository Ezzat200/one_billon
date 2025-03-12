
import 'package:flutter/material.dart';
import 'package:one_billon/shared/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, required this.onTap,
  });
final String text;
final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 34,
        width: 155,
        decoration: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(text,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xffFFFFFF)),),
        ),
      ),
    );
  }
}
