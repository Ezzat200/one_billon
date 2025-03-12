
import 'package:flutter/material.dart';
import 'package:one_billon/shared/color.dart';

class CustomIntoductionTextBlog extends StatelessWidget {
  const CustomIntoductionTextBlog({
    super.key, required this.introName,
  });
final String introName;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Image.asset('assets/images/dot.png'),
      SizedBox(width: 10),
      Text(introName,style: TextStyle(fontSize: 14,fontWeight: FontWeight
      .w400,color: ColorManager.primary,height: 1.8,),),
      
      ],
    );
  }
}