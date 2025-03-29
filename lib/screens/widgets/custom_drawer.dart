import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/auth/login/login_screen.dart';
import 'package:one_billon/screens/blog/blog_screen.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/profile/profile_screen.dart';
import 'package:one_billon/screens/sections/sections_screen.dart';
import 'package:one_billon/screens/services/services_screen.dart';
import 'package:one_billon/shared/helper/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OneBillonCubit, OneBillonStates>(
      builder: (context, state) {
        var cubit = OneBillonCubit.get(context);
        return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Color(0xff073455A6).withOpacity(.65),
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => Container(
                  padding: EdgeInsets.all(16),
                  height: 360,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: 23,
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset('assets/images/close.png'))
                        ],
                      ),

                      width: double.infinity,
                      child: Center(child: Text('Home',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),))),
                   ),
                  
                SizedBox(height: 35,),
                 GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SectionsScreen();
                      },));
                    },
                    child: Text('Sections',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),)),
                SizedBox(height: 35,),
                   GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return ServicesScreen();
                      },));
                    },
                    child: Text('Services',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),)),
                SizedBox(height: 35,),
    
                 GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return BlogScreen();
                      },));
                    },
                    child: Text('Blog',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),)),
                SizedBox(height: 35,),
    
                   
    
    
              GestureDetector(
                    // onTap: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //     return ProfileScreen();
                    //   },));
                    // },
                    child: Text('Services',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),)),
                SizedBox(height: 35,),
    
                   Text('Sign Out',style: TextStyle(color: Color(0xffFF8D00),fontWeight: FontWeight.w700,fontSize: 20),),
    
                
              ],
            ),
          ),
        );

                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          cubit.currentIndex != 0
                              ? cubit.changeBottomNavBar(0)
                              : log("done");
                        },
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Color(0xff007EDB),
                            ),
                            width: double.infinity,
                            child: Center(
                                child: Text(
                               S.of(context).home,
                              style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20),
                            ))),
                      ),

                      SizedBox(
                        height: 35,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ServicesScreen();
                              },
                            ));
                          },
                          child: Text(
                             S.of(context).services,
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          )),
                      SizedBox(
                        height: 35,
                      ),

                      GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return BlogScreen();
                              },
                            ));
                          },
                          child: Text(
                            S.of(context).blog,
                            style: TextStyle(
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w700,
                                fontSize: 20),
                          )),
                      SizedBox(
                        height: 35,
                      ),

                      // GestureDetector(
                      //       onTap: () {
                      //         Navigator.push(context, MaterialPageRoute(builder: (context) {
                      //           return ProfileScreen();
                      //         },));
                      //       },
                      //       child: Text('Services',style: TextStyle(color: Color(0xffFFFFFF),fontWeight: FontWeight.w700,fontSize: 20),)),
                      //   SizedBox(height: 35,),

                      AppConfig.token != null
                          ? InkWell(
                              onTap: () async {
                                Navigator.pop(
                                    context); // اقفل الـ BottomSheet أولاً

                                // بعد ما يتقفل، اعرض الـ SnackBar
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  final scaffoldMessenger =
                                      ScaffoldMessenger.of(context);
                                  scaffoldMessenger.showSnackBar(
                                     SnackBar(
                                      content: Text( S.of(context).logoutSuccess),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                });

                                AppConfig.token = null;

                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.remove('token');
                              },
                              child: Text(
                               S.of(context).signOut,
                                style: TextStyle(
                                    color: Color(0xffFF8D00),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginScreen();
                                }));
                              },
                              child: Text(
                                S.of(context).login,
                                style: TextStyle(
                                    color: Color(0xffFF8D00),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20),
                              ))
                    ],
                  ),
                ),
              );
            },
            child: SvgPicture.asset('assets/images/Group 44 (1).svg'));

      },
      listener: (context, state) {},
    );
  }
}
