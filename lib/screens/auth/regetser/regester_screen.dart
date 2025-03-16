import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/generated/l10n.dart';
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
                Text(S.of(context).welcome,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff007EDB),
                    )),
                Text(S.of(context).createAccount,
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
                          fiedlName: S.of(context).username,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).please_enter_username;
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomAuthTextFiedl(
                          fiedlName: S.of(context).email,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).please_enter_email;
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return S.of(context).please_enter_valid_email;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        CustomAuthTextFiedl(
                          fiedlName: S.of(context).phone,
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).please_enter_phone;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        CustomAuthPasswordField(
                          fieldName: S.of(context).password,
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).please_enter_password;
                            }
                            if (value.length < 6) {
                              return S.of(context).password_min_length;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 15),
                        CustomAuthPasswordField(
                          fieldName: S.of(context).confirm_password,
                          controller: confirmPasswordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return S.of(context).please_confirm_password;
                            }
                            if (value != passwordController.text) {
                              return S.of(context).passwords_do_not_match;
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 25),
                        CustomAuthButton(
                          nameButton: S.of(context).createAccount,
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
                            Text(S.of(context).already_have_account,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff414141))),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }));
                              },
                              child: Text(S.of(context).login,
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
