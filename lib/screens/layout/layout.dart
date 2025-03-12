// import 'dart:ui_web';

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_billon/screens/widgets/custom_appbar.dart';
import 'package:one_billon/screens/widgets/custom_drwer.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/shared/color.dart';


class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    var cubit = OneBillonCubit.get(context);

    return BlocConsumer<OneBillonCubit, OneBillonStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            key: scaffoldKey,
             body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              key: bottomNavigationKey,
              color: Color(0xff004375),
              index: cubit
                  .currentIndex, // Use cubit.currentIndex for dynamic selection
              items: [
                  CurvedNavigationBarItem(
                  labelStyle: TextStyle(
                    color: cubit.currentIndex == 0
                        ? ColorManager.primary
                        : ColorManager
                            .navbarIconColor, // Set unselected label color
                  ),
                  child: Image.asset(
                    'assets/images/home.png',
                    color: cubit.currentIndex == 0
                        ? ColorManager.white
                        : ColorManager
                            .navbarIconColor, // Set unselected icon color
                  ),
                  label: "Home",
                ),
                 CurvedNavigationBarItem(
                  labelStyle: TextStyle(
                    color: cubit.currentIndex == 1
                        ? ColorManager.primary
                        : ColorManager
                            .navbarIconColor, // Set unselected label color
                  ),
                  child: Image.asset(
                    'assets/images/services.png',
                    color: cubit.currentIndex == 1
                        ? ColorManager.white
                        : ColorManager
                            .navbarIconColor, // Set unselected icon color
                  ),
                  label: "Services",
                ),
                CurvedNavigationBarItem(
                  labelStyle: TextStyle(
                    color: cubit.currentIndex == 2
                        ? ColorManager.primary
                        : ColorManager
                            .navbarIconColor, // Set unselected label color
                  ),
                  child: Image.asset(
                    'assets/images/blog.png',
                    color: cubit.currentIndex == 2
                        ? ColorManager.white
                        : ColorManager
                            .navbarIconColor, // Set unselected icon color
                  ),
                  label: "Blog",
                ),
                CurvedNavigationBarItem(
                  labelStyle: TextStyle(
                    color: cubit.currentIndex == 3
                        ? ColorManager.primary
                        : ColorManager
                            .navbarIconColor, // Set unselected label color
                  ),
                  child: Image.asset(
                    'assets/images/Vector.png',
                    color: cubit.currentIndex == 3
                        ? ColorManager.white
                        : ColorManager
                            .navbarIconColor, // Set unselected icon color
                  ),
                  label: "Profile",
                ),
                 
               
              ],
              
              
              buttonBackgroundColor: ColorManager.primary,
              backgroundColor: ColorManager.greyShade200,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 500),
              onTap: (index) => cubit.changeBottomNavBar(index),
              letIndexChange: (index) => true,
            ),
          );
        });
  }
}
