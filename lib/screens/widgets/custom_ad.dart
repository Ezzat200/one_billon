
import 'package:flutter/material.dart';

class CustomAd extends StatelessWidget {
  const CustomAd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container
    (
      decoration: BoxDecoration(
        color: Color(0xff004375),
        borderRadius: BorderRadius.circular(8)),

      width: double.infinity,height: 90,child: Center(child: Text('Advertisement Space',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 20),),),);
  }
}