import 'package:flutter/material.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/screens/widgets/custom_profile.dart';
import 'package:one_billon/shared/color.dart';
class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key,  this.image,  });
final String ?image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                            child: Image.asset('assets/images/logo.png', height: 33, width: 50)),
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
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 27,vertical: 15),
                           child: Text('Profile',style: TextStyle(color: Color(0xff414141),fontWeight: FontWeight.w500,fontSize: 16),),
                         ),
                         SizedBox(height: 20,),
                         Stack(
                          clipBehavior: Clip.none,
                          children: [
                            
                            
                              Container(
                              height: 83,
                              width: double.infinity,
                              color: Color(0xffF5F5F5),
                            ),
                            Positioned(
                              left: 50,
                              right: 50,
                              bottom: -130,
                              
                              child: Image.asset('assets/images/profileimage.png')),
                          ],
                         ),
                         SizedBox(height: 60,),
Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Text('Ammar Alsaied',style: TextStyle(color: Color(0xff007EDB),fontWeight: FontWeight.w700,fontSize: 18),),
  SizedBox(height: 20,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('Edit Data',style: TextStyle(color: Color(0xff959595),fontWeight: FontWeight.w400,fontSize: 14),),
      SizedBox(width: 10,),
      Image.asset('assets/images/editData.png')
    ],
  )
  ],
),
SizedBox(height: 30,),
Padding(
  padding: const EdgeInsets.symmetric(horizontal: 27,vertical: 20),
  child: Column(
    children: [
      CustomProfile(
        imageprofile: 'assets/images/person.png',
        dataName: 'User Name',
        dataDesc: 'Ammar Alsaied',
      ),
     
     
      SizedBox(height: 22,),
            CustomProfile(
        imageprofile: 'assets/images/email.png',
        dataName: 'User Name',
        dataDesc: 'Ammar Alsaied',
      ),
      SizedBox(height: 22,),
            CustomProfile(
        imageprofile: 'assets/images/phone.png',
        dataName: 'User Name',
        dataDesc: 'Ammar Alsaied',
      ),
      SizedBox(height: 22,),
            CustomProfile(
        imageprofile: 'assets/images/lock.png',
        dataName: 'User Name',
        dataDesc: 'Ammar Alsaied',
      ),
      SizedBox(height: 22,),
      Container(
        height: 44,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorManager.primary,
          
        ),
        child: Row(
          children: [
            SizedBox(width: 10,),
            Image.asset('assets/images/signout.png',width: 18,height: 18,),
            SizedBox(width: 10,),
            Text('Sign Out',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:
            ColorManager.white),),
          ],
        ),
      )
    ],
  ),
)
                       ],
                     )
          ],
        ),
      ));
  }
}
