import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/models/service_model.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/services/service_form.dart';
import 'package:one_billon/screens/widgets/custom_button.dart';
import 'package:one_billon/screens/widgets/custom_drawer.dart';
import 'package:one_billon/screens/widgets/custom_text.dart';
import 'package:one_billon/screens/widgets/poup.dart';
import 'package:one_billon/shared/color.dart';
import 'package:one_billon/shared/helper/helper.dart';
import 'package:shimmer/shimmer.dart';

class ServiceDetails extends StatelessWidget {
  const ServiceDetails({super.key, this.serviceModel});
  final ServiceModel? serviceModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
        final cubit = OneBillonCubit.get(context);
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
                              CachedNetworkImage(
                                imageUrl: serviceModel!.img,
                                height: 40,
                                fit: BoxFit.contain,
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    color: Colors.white,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                              SizedBox(height: 20),
                              Text(
                                cubit.languageCode == 'en'
                                    ? serviceModel!.nameEn
                                    : serviceModel!.nameAr,
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

                              SizedBox(
                                height: 30,
                              ),

                              Text("السعر"),
                              SizedBox(height: 8,),

                              Text("${serviceModel!.price.toString()} \$")

                              // CustomText(
                              //       text: cubit.languageCode == 'en'
                              //           ? serviceModel!.price.toString()// or ', ' or ' • '
                              //           : serviceModel!.price.toString(),
                              //     ),

                              // Row(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(top: 10),
                              //       child: Image.asset('assets/images/dot.png'),
                              //     ),
                              //     SizedBox(width: 10),
                              //     CustomText(
                              //       text: cubit.languageCode == 'en'
                              //           ? serviceModel!.price.toString()// or ', ' or ' • '
                              //           : serviceModel!.price.toString(),
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
                        text:  S.of(context).Get_the_services ,
                        onTap: () {
                          
                          AppConfig.token != null
                              ? Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ServiceForm(service: serviceModel!.nameAr, price: serviceModel!.price,);
                                  },
                                ))
                              : dialog(context);

                          
                        },
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  )),

              Container(
                height: 100,
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
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ),
                            Row(
                              children: [
                                CustomDrawer()
                                // SvgPicture.asset('assets/images/Group 44 (1).svg'
                                // ),
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

           
            ],
          ),
        ));
      },
      listener: (context, state) {},
    );
  }
}
