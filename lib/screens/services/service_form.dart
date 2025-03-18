import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/layout/layout.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';

import 'package:one_billon/screens/widgets/custom_drawer.dart';

import 'package:one_billon/screens/widgets/custom_text_field.dart';

class ServiceForm extends StatefulWidget {
  const ServiceForm({super.key, required this.service});

  final String service;

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isLoading = false;

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
                  child: Column(children: [
                    CustomTextField(
                      fieldName: S.of(context).username,
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).please_enter_username;
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      fieldName: S.of(context).email,
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).please_enter_email;
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return S.of(context).please_enter_valid_email;
                        }
                        return null;
                      },
                    ),
                    CustomTextField(
                      fieldName: S.of(context).phone,
                      controller: _phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).please_enter_phone;
                        }
                        if (!RegExp(r'^\d{10,}$').hasMatch(value)) {
                          return S.of(context).Enter_a_valid_phone_number;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: S.of(context).Submit_Data,
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
                            service: widget.service,
                          )
                              .then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(S
                                      .of(context)
                                      .The_data_has_been_successfully_submitted)),
                            );

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LayoutScreen()),
                              (route) => false,
                            );
                          }).catchError((e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(S
                                      .of(context)
                                      .An_error_occurred_during_submission)),
                            );
                          });
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/arrow.png',
                                height: 33, width: 50)),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: cubit.languageCode == 'en'
                                  ? SvgPicture.asset(
                                      'assets/images/Group 45.svg')
                                  : SvgPicture.asset(
                                      'assets/images/Group 45 (1).svg'),
                            )
                            // Row(
                            //   children: [
                            //     CustomDrawer(),
                            //     const SizedBox(width: 10),
                            //     // Image.asset('assets/images/notification.png'),
                            //   ],
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ])),
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
                            child: cubit.languageCode == 'en'
                                ? SvgPicture.asset('assets/images/Group 45.svg')
                                : SvgPicture.asset(
                                    'assets/images/Group 45 (1).svg'),
                          ),
                          Row(
                            children: [
                              // Image.asset('assets/images/drwer.png'),
                              CustomDrawer(),
                              // const SizedBox(width: 10),
                              // Image.asset('assets/images/notification.png'),
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
                      Text(
                        S.of(context).search,
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
