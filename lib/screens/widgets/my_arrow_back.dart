
import 'package:flutter/material.dart';
import'dart:io' show Platform;
class MyArrowBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? Container(
      padding: EdgeInsets.only(left: 20,top: 20),
      child: RotatedBox(
        quarterTurns: 2,
        child: Row(
          children: [
            InkWell(
              onTap: ()
              {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.red.withOpacity(0),
                  child: Icon(Icons.arrow_back_ios ,color: Colors.white,size: 22,)),
            ),
          ],
        ),
      ),
    ):SizedBox();
  }
}
