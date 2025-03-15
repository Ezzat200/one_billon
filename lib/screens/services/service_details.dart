import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/models/service_model.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/services/service_form.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';
import 'package:one_billon/screens/widgets/custom_text.dart';
import 'package:one_billon/shared/color.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key, this.serviceModel});
  final ServiceModel? serviceModel;
  @override
  Widget build(BuildContext context) {
    final cubit = OneBillonCubit.get(context);
    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 27, right: 27, top: 170),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // border: Border.all(color: Color(0xffE6E6E6)),
                          borderRadius: BorderRadius.circular(8),
                          border: Border(
                            bottom: BorderSide(
                                color: ColorManager.primary,
                                width: 5), // Border السفلي
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 25),
                          child: Column(
                            children: [
                              Image.network(
                                serviceModel!.img,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 20),
                              Text(
                                cubit.languageCode == 'en'
                                    ? serviceModel!.nameAr
                                    : serviceModel!.nameEn,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff424C57),
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image.asset('assets/images/dot.png'),
                                  ),
                                  SizedBox(width: 10),
                                  CustomText(
                                    text: cubit.languageCode == 'en'
                                        ? serviceModel!.featuresEn
                                            .join('\n') // or ', ' or ' • '
                                        : serviceModel!.featuresAr.join('\n'),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 20),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 10),
                              //       child: Image.asset('assets/images/dot.png'),
                              //     ),
                              //     SizedBox(width: 10),
                              //     CustomText(
                              //       text:
                              //           "We are a leading company in exhibition and conference management, as well as the entertainment events industry. We integrate creativity with advanced technological innovation, including artificial intelligence applications, to create exceptional experiences that deliver real value to our clients.",
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(height: 20),
                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 10),
                              //       child: Image.asset('assets/images/dot.png'),
                              //     ),
                              //     SizedBox(width: 10),
                              //     CustomText(
                              //       text:
                              //           "We are a leading company in exhibition and conference management, as well as the entertainment events ",
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                        text: 'Get the Service',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ServiceForm();
                            },
                          ));
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  )),

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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 27, vertical: 10),
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
                                    height: 33, width: 50)),
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
      },
      listener: (context, state) {},
    );
  }
}
