
import 'package:flutter/material.dart';

class CustomAuthTextFiedl extends StatelessWidget {
  const CustomAuthTextFiedl({
    super.key, required this.fiedlName,
  });
final String fiedlName;
  @override
  Widget build(BuildContext context) {
    return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           Text('Uswer name',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xff414141)),),
           SizedBox(height: 8,),
            TextFormField(
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
