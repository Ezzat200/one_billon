import 'package:flutter/material.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';


import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/screens/widgets/custom_text.dart';

import 'package:one_billon/screens/widgets/custom_text_field.dart';
import 'package:one_billon/shared/color.dart';

import 'package:flutter/material.dart';

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key});

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = OneBillonCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 170, left: 27, right: 27),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [

                    CustomTextField(
                      fieldName: 'User Name',
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      fieldName: 'Email',
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      fieldName: 'Phone Number',
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^\d{10,}$').hasMatch(value)) {
                          return 'Enter a valid phone number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Submit Data',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // All data is valid
                          print('Name: ${_nameController.text}');
                          print('Email: ${_emailController.text}');
                          print('Phone: ${_phoneController.text}');

                          final name = _nameController.text.trim();
                          final email = _emailController.text.trim();
                          final phone = _phoneController.text.trim();

                          cubit
                              .submitOrder(
                            name: name,
                            email: email,
                            phone: phone,
                            // service: service,
                          )
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('تم إرسال البيانات بنجاح')),
                            );
                          }).catchError((e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('حدث خطأ أثناء الإرسال')),
                            );
                          });
                        }
                      },
                    ),

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

            // AppBar like design
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/arrow.png',
                                height: 33, width: 50),
                          ),
                          Row(
                            children: [
                              Image.asset('assets/images/drwer.png'),
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

            // Search Box
            Positioned(
              top: 110,
              left: 27,
              right: 27,
              child: Container(
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
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
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
