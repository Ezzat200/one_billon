
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key, required this.text,
  });
final String text ;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(text,style: TextStyle(fontSize: 16,fontWeight: FontWeight
      .w500,color: Color(0xff7A7A7A),height: 1.8,),),
    );
  }
}