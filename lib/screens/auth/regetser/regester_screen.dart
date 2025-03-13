import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/screens/auth/login/login_screen.dart';
import 'package:one_billon/screens/auth/regetser/cubit/cubit.dart';
import 'package:one_billon/screens/auth/regetser/cubit/states.dart';
import 'package:one_billon/screens/widgets/custom_auth_button.dart';
import 'package:one_billon/screens/widgets/custom_auth_text_field.dart';
import 'package:one_billon/screens/widgets/password_field.dart';
import 'package:one_billon/shared/color.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = OneBillonRegisterCubit.get(context);
    return BlocConsumer<OneBillonRegisterCubit, OneBillonRegisterStates>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/login.png'),
                          fit: BoxFit.cover,
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
                SizedBox(height: 37),
                Text("Welcome",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff007EDB),
                    )),
                Text("Create an account",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff007EDB),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        CustomAuthTextFiedl(
                          fiedlName: 'User Name',
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomAuthTextFiedl(
                          fiedlName: 'Email',
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        CustomAuthTextFiedl(
                          fiedlName: 'Phone Number',
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        CustomAuthPasswordField(
                          fieldName: 'Password',
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        CustomAuthPasswordField(
                          fieldName: 'Confirm Password',
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 25),
                        CustomAuthButton(
                          nameButton: 'Create an account',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              
                              // تابع إنشاء الحساب أو إرسال البيانات هنا
                              cubit.registerUser(
                                name: nameController.text,
                                email: emailController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                                context: context,
                              );
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            Text("Already have an account?  ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff414141))),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }));
                              },
                              child: Text(" Login. ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff007EDB))),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
