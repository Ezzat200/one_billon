import 'package:flutter/material.dart';
import 'package:one_billon/screens/auth/regetser/regester_screen.dart';
import 'package:one_billon/screens/widgets/custom_auth_button.dart';
import 'package:one_billon/screens/widgets/custom_auth_text_field.dart';
import 'package:one_billon/screens/widgets/password_field.dart';
import 'package:one_billon/shared/color.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            Text("Login", style: TextStyle(
              fontSize: 32, fontWeight: FontWeight.w700, color: Color(0xff007EDB)
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27),
              child: Column(
                children: [
                  CustomAuthTextFiedl(
                    fiedlName: 'Email',
                  ),
                  SizedBox(height: 15,),
                  CustomAuthPasswordField(fieldName: 'Password'),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                       Checkbox(
                        checkColor: Color(0xffD9D9D9),
                        side: BorderSide(color: Color(0xffD9D9D9)),
                        value: false,
                        onChanged: (bool? value) {},
                      ),
                      Text("Remember Me", style: TextStyle(fontSize: 14, color: Color(0xff414141))),
                      SizedBox(height: 35,),
                    ],
                  ),
                      CustomAuthButton(
                        nameButton: 'Login',
                        onTap: () {
                         
                        },
                      ),
                      SizedBox(height: 15,),
                       Row(
                         children: [
                           Text("Don't have an account? ", style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700, color: Color(0xff414141))),
                       GestureDetector(
                        onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) {
                            return RegesterScreen();
                          },));
                        },
                        child: Text("Create an account. ", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700, color: ColorManager.primary))),
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
