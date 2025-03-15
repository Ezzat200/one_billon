
import 'package:flutter/material.dart';

class CustomProfile extends StatelessWidget {
  const CustomProfile({
    super.key, required this.imageprofile, required this.dataName, required this.dataDesc,
  });
final String imageprofile;
final String dataName;
final String dataDesc;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE5E5E5)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          children: [
            Image.asset(imageprofile),
            SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(dataName,style: TextStyle(color: Color(0xff7A7A7A),fontWeight: FontWeight
                .w400,fontSize: 12),),
                Text(dataDesc,style: TextStyle(color: Color(0xff007EDB),fontWeight: FontWeight
                .w400,fontSize: 14),),
              ],
            ),
        
          ],
        ),
      ),
    );
  }
}
