import 'package:flutter/material.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';
import 'package:one_billon/screens/widgets/custom_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/images/background.png',width: double.infinity,fit: BoxFit.cover,),
              Positioned
              (
                top: 50,
                left: 27,
                child: Image.asset('assets/images/arrow.png')),
                Positioned(
                  
                  top: 0,
                  left: 27,
                  right: 27,
                  child: Image.asset('assets/images/profileimage.png')),
                
            ],

          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27,vertical: 40),
            child: Column(
              children: [
                CustomTextField(fieldName: 'User Name'),
                SizedBox(height: 15,),
                CustomTextField(fieldName: 'Email'),
                SizedBox(height: 15,),

                CustomTextField(fieldName: 'Phone Number'),
                SizedBox(height: 15,),

                CustomTextField(fieldName: 'Password'),
                SizedBox(height: 20,),

                CustomButton(text: 'Save Data', onTap: (){})

              ],
            ),
          )
        ],
      ),
    );
  }
}