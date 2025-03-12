
import 'package:flutter/material.dart';

class CustomContentTextBlog extends StatelessWidget {
  const CustomContentTextBlog({
    super.key, required this.contentString,
  });
final String contentString;
  @override
  Widget build(BuildContext context) {
    return Text(contentString,style: TextStyle(fontSize: 12,fontWeight: FontWeight
    .w400,color: Color(0xff7A7A7A),height: 1.8,overflow: TextOverflow.visible),);
  }
}