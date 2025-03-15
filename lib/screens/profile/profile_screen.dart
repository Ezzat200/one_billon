import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';
import 'package:one_billon/screens/widgets/custom_text_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();
    final TextEditingController _PasswordController = TextEditingController();

    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
        final cubit = OneBillonCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    'assets/images/background.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Positioned(
                  //   top: 50,
                  //   left: 27,
                  //   child: cubit.languageCode == 'en'
                  //       ? SvgPicture.asset('assets/images/Group 45.svg')
                  //       : SvgPicture.asset('assets/images/Group 45 (1).svg'),
                  // ),
                  Positioned(
                      top: 0,
                      left: 27,
                      right: 27,
                      child: Image.asset('assets/images/profileimage.png')),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 40),
                child: Column(
                  children: [
                    CustomTextField(
                      fieldName: 'User Name',
                      controller: _nameController,
                      validator: (p0) {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      fieldName: 'Email',
                      controller: _emailController,
                      validator: (p0) {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      fieldName: 'Phone Number',
                      controller: _phoneController,
                      validator: (p0) {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      fieldName: 'Password',
                      controller: _PasswordController,
                      validator: (p0) {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(text: 'Save Data', onTap: () {})
                  ],
                ),
              )
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
