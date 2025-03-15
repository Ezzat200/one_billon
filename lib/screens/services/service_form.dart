import 'package:flutter/material.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/screens/widgets/custom_text.dart';
import 'package:one_billon/screens/widgets/custom_text_field.dart';
import 'package:one_billon/shared/color.dart';

class ServiceForm extends StatelessWidget {
  const ServiceForm({super.key,  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
        children: [
  
         Padding(
           padding: const EdgeInsets.only(top: 170,left: 27,right: 27),
           child: Column(
             children: [
               CustomTextField(
                fieldName: 'User Name',
               ),
                 CustomTextField(
                fieldName: 'Email',
               ),
                 CustomTextField(
                fieldName: 'Phone Number',
               ),
               SizedBox(height: 20,),
               CustomButton(text: 'Submit Data', onTap: () {
                 
               },)
             ],
           )

         )
,

        
          Container(
            height: 140, 
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff007EDB), Color(0xff004375)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(onTap: () {
                          Navigator.pop(context);
                        },
                          child: Image.asset('assets/images/arrow.png', height: 33, width: 50)),
                        Row(
                          children: [
                                CustomDrawer(),
                            const SizedBox(width: 10),
                            Image.asset('assets/images/notification.png'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // صندوق البحث الذي يمتد جزئياً إلى الصفحة
          Positioned(
            top: 110, // نصفه داخل الـ AppBar والنصف الآخر في الصفحة
            left: 27,
            right: 27,
            child: Container(
              height: 42,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.asset('assets/images/search.png'),
                    const SizedBox(width: 10),
                    const Text(
                      "Search...",
                      style: TextStyle(
                          color: Color(0xffE6E6E6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
