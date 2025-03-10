
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, Cubit;
import 'package:one_billon/screens/home/home.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/profile/profile_screen.dart';
import 'package:one_billon/screens/services/service_details.dart';
import 'package:one_billon/screens/services/services_screen.dart';


class OneBillonCubit extends Cubit<OneBillonStates> {
  OneBillonCubit() : super(SIGInitialState());

  static OneBillonCubit get(context) => BlocProvider.of(context);

  int currentIndex = 1;

void openServiceDetails(BuildContext context,String title ,String image) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ServiceDetails(title: title,image: image,)),
  );
}


  String languageCode = 'en';

  List<Widget> screens = [
    ServicesScreen(),
    Home(),
    ProfileScreen(),
   ServiceDetails(), // أضف صفحة التفاصيل

  ];


  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(SIGChangeBottomNavBarState());
  }
  


}