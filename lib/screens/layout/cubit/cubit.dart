
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, Cubit;
import 'package:one_billon/screens/blog/blog_screen.dart';
import 'package:one_billon/screens/home/home.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/profile/profile_screen.dart';
import 'package:one_billon/screens/services/service_details.dart';
import 'package:one_billon/screens/services/services_screen.dart';


class OneBillonCubit extends Cubit<OneBillonStates> {
  OneBillonCubit() : super(SIGInitialState());

  static OneBillonCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

void openServiceDetails(BuildContext context,String title ,String image) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ServiceDetails(title: title,image: image,)),
  );
}



  String languageCode = 'en';

  List<Widget> screens = [
    Home(),
    ServicesScreen(),
    BlogScreen(),
   
    ProfileScreen(),

  ];


  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(SIGChangeBottomNavBarState());
  }
  


}