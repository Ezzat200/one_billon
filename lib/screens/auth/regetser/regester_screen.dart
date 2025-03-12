import 'package:flutter/material.dart';
import 'package:one_billon/screens/auth/login/login_screen.dart';
import 'package:one_billon/screens/widgets/custom_auth_button.dart';
import 'package:one_billon/screens/widgets/custom_auth_text_field.dart';
import 'package:one_billon/screens/widgets/password_field.dart';
import 'package:one_billon/shared/color.dart';

class RegesterScreen extends StatelessWidget {
  const RegesterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center, // يجعل الشعار في منتصف الصورة الأولى
              children: [
                Container(
                  width: double.infinity, // تأخذ العرض بالكامل
                  height: 250, // تعديل الارتفاع حسب الحاجة
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.png'),
                      fit: BoxFit.cover, // تجعل الصورة تغطي المساحة المحددة بالكامل
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/logo.png',
                  height: 84,
                  width: 129,
                ),
              ],
            ),
            SizedBox(height: 37,),
            Text("Welcome", style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: ColorManager.primary
            )),
            Text("Create an account", style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w700, color: Color(0xff007EDB)
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                children: [
                     SizedBox(height: 15,),
                  CustomAuthTextFiedl(fiedlName: 'User Name'),
                  CustomAuthTextFiedl(
                    fiedlName: 'Email',
                  ),
                     SizedBox(height: 15,),
                  CustomAuthTextFiedl(fiedlName: 'Phone Number'),
                  SizedBox(height: 15,),
                  CustomAuthPasswordField(fieldName: 'Password'),
                     SizedBox(height: 15,),
                  CustomAuthPasswordField(fieldName: 'Confirm Password'),
                  SizedBox(height: 10,),
                
                      CustomAuthButton(
                        nameButton: 'Create an account',
                        onTap: () {
                         
                        },
                      ),
                      SizedBox(height: 15,),
                       Row(
                         children: [
                           Text("Already have an account?  ", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700, color: Color(0xff414141))),
                       GestureDetector(
                        onTap: () {
                           Navigator.push(context,MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          },));
                        },
                        child: Text(" Login. ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700, color: ColorManager.primary))),
                         ],
                       ),
                       SizedBox(height: 20,)

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
