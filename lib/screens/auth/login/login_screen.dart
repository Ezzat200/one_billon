import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/screens/auth/login/cubit/cubit.dart';
import 'package:one_billon/screens/auth/login/cubit/states.dart';
import 'package:one_billon/screens/auth/regetser/regester_screen.dart';
import 'package:one_billon/screens/widgets/custom_auth_button.dart';
import 'package:one_billon/screens/widgets/custom_auth_text_field.dart';
import 'package:one_billon/screens/widgets/password_field.dart';
import 'package:one_billon/shared/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool rememberMe = false;


  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = OneBillonLoginCubit.get(context);
    return BlocConsumer<OneBillonLoginCubit, OneBillonLoginStates>(
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
                      color: ColorManager.primary,
                    )),
                Text("Login",
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
                        CustomAuthTextFiedl(
                          fiedlName: 'Email',
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
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
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Color(0xFF007EDB),
                              side: const BorderSide(color: Color(0xffD9D9D9)),
                              value: rememberMe,
                              onChanged: (bool? value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                            ),
                            Text("Remember Me",
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xff414141))),
                          ],
                        ),
                        SizedBox(height: 35),
                        CustomAuthButton(
                          nameButton: 'Login',
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              print("Email: ${emailController.text}");
                              print("Password: ${passwordController.text}");
                              // هنا تقدر تنادي على دالة loginUser()
                              cubit.loginUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context);
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff414141))),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RegisterScreen()));
                              },
                              child: Text("Create an account.",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: ColorManager.primary)),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
