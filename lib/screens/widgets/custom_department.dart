
import 'package:flutter/material.dart';

class CustomDepartment extends StatelessWidget {
  const CustomDepartment({
    super.key, required this.secName,
  });
final String secName;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
    Image.asset('assets/images/department.png'),
    Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Positioned(
          top: 40,
          // // left: 25,
          // right: 25,
          child: Text(secName,style: TextStyle(color: Color(0xff414141),fontWeight: FontWeight.w400,fontSize: 12),)),
      ),
    ),
      Positioned(
        top: -10,
        left: 25,
        right: 25,
        child: Image.asset('assets/images/departmentcircle.png'))
      ],
    );
  }
}
