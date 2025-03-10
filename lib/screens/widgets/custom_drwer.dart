import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_billon/shared/color.dart';
import 'package:one_billon/shared/size.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: ColorManager.black,
        child: Column(children: [
          Container(
            width: double.infinity,
            height: AppSize.s200.h,
            color: ColorManager.primary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: AppSize.s60.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppPadding.p15.w),
                  child: Container(
                      width: AppSize.s23.w,
                      height: AppSize.s23.h,
                      decoration: BoxDecoration(
                          border: Border.all(color: ColorManager.white),
                          borderRadius: BorderRadius.circular(23 / 2)),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState?.closeEndDrawer();
                        },
                        child: Icon(
                          Icons.close,
                          size: AppSize.s15.sp,
                          color: ColorManager.white,
                        ),
                      ))),
                ),
                SizedBox(
                  height: AppMargin.m10.h,
                ),
                Row(
                  children: [
                    Container(
                      width: AppSize.s100.w,
                      height: AppSize.s100.h,
                      child: Stack(children: [
                        Positioned(
                            top: 17.h,
                            right: 17.w,
                            child: Container(
                              width: AppSize.s60.w / 1.4,
                              height: AppSize.s60.h / 1.4,
                              decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  borderRadius: BorderRadius.only(
                                      topRight:
                                          Radius.circular(AppRadius.r20.r))),
                            )),
                        Positioned(
                            bottom: 17,
                            left: 17,
                            child: Container(
                              width: AppSize.s60.w / 1.4,
                              height: AppSize.s60.h / 1.4,
                              decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20))),
                            )),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            width: AppSize.s60.w,
                            height: AppSize.s60.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage('assets/icons/man.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                      ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mohamed Ahmed',
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s16.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'View Profile',
                          style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: AppPadding.p30.w, top: AppPadding.p30.w),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     _scaffoldKey.currentState?.closeEndDrawer();
                      //     navigateTo(context, '/', 'id');
                      //   },
                      //   child: CustomCardDrwer(
                      //     textImage: 'assets/icons/home.png',
                      //     text: 'Home Page',
                      //   ),
                      // ),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),

                      // GestureDetector(
                      //   onTap: () {
                      //     _scaffoldKey.currentState?.closeEndDrawer();
                      //     navigateTo(context, '/nearbyEstates', 'id');
                      //   },
                      //   child: CustomCardDrwer(
                      //     textImage: 'assets/icons/nearby.png',
                      //     text: 'Explore Nearby Estates',
                      //   ),
                      // ),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _scaffoldKey.currentState?.closeEndDrawer();
                      //     navigateTo(context, '/most_popular_cities', 'id');
                      //   },
                      //   child: CustomCardDrwer(
                      //     textImage: 'assets/icons/toplocation.png',
                      //     text: 'Top Location',
                      //   ),
                      // ),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _scaffoldKey.currentState?.closeEndDrawer();
                      //     navigateTo(context, '/popular_projects', 'id');
                      //   },
                      //   child: CustomCardDrwer(
                      //     textImage:
                      //         'assets/icons/officebuilding-svgrepo-com.png',
                      //     text: 'Popular Projects',
                      //   ),
                      // ),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _scaffoldKey.currentState?.closeEndDrawer();
                      //     navigateTo(context, '/aboutus', 'id');
                      //   },
                      //   child: CustomCardDrwer(
                      //     textImage: 'assets/icons/AboutusDrawer.png',
                      //     text: 'About us',
                      //   ),
                      // ),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _scaffoldKey.currentState?.closeEndDrawer();
                      //     navigateTo(context, '/contactus', 'id');
                      //   },
                      //   child: CustomCardDrwer(
                      //     textImage: 'assets/icons/contactusDrwer.png',
                      //     text: 'Contatct us',
                      //   ),
                      // ),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     _scaffoldKey.currentState?.closeEndDrawer();
                      //     navigateTo(context, '/termsAndConditions', 'id');
                      //   },
                      //   child: CustomCardDrwer(
                      //     textImage: 'assets/icons/termsAndcondtion.png',
                      //     text: 'Terms and Conditions',
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: AppSize.s40.h,
                      // ),
                      // CustomCardDrwer(
                      //   textImage: 'assets/icons/favorite.png',
                      //   text: 'Favorite',
                      // ),
                      // SizedBox(
                      //   height: AppSize.s40.h,
                      // ),
                      // GestureDetector(
                      //   onTap: () {
                      //     navigateTo(context, '/location', 'id');
                      //
                      //   },
                      //   child: CustomCardDrwer(
                      //     textImage: 'assets/icons/location.png',
                      //     text: 'Location',
                      //   ),
                      // ),
                      SizedBox(
                        height: AppSize.s40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: AppPadding.p30, bottom: AppPadding.p34),
                        child: Container(
                          width: double.infinity,
                          height: AppSize.s33.h,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: AppSize.s1.w,
                                  color: ColorManager.primary),
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r8.r),
                              color: ColorManager.primary.withOpacity(0.1)),
                          child: GestureDetector(
                            onTap: () {
                              // SIGAppCubit.get(context).signOut(context);
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: AppPadding.p7.w,
                                ),
                                Image.asset(
                                  'assets/icons/logoutn.png',
                                  width: AppSize.s20.w,
                                  color: ColorManager.primary,
                                ),
                                SizedBox(
                                  width: AppPadding.p7.w,
                                ),
                                Text(
                                  'Logout',
                                  style: TextStyle(color: ColorManager.primary),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]));
  }
}
