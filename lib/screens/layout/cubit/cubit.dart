import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, Cubit;
import 'package:one_billon/models/blog_model.dart';
import 'package:one_billon/models/service_model.dart';
import 'package:one_billon/screens/blog/blog_screen.dart';
import 'package:one_billon/screens/home/home.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/profile/profile_details.dart';
import 'package:one_billon/screens/profile/profile_screen.dart';
import 'package:one_billon/screens/services/service_details.dart';
import 'package:one_billon/screens/services/services_screen.dart';

class OneBillonCubit extends Cubit<OneBillonStates> {
  OneBillonCubit() : super(SIGInitialState());

  static OneBillonCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void openServiceDetails(BuildContext context, String title, String image) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ServiceDetails(
                title: title,
                image: image,
              )),
    );
  }

  String languageCode = 'en';

  List<Widget> screens = [
    Home(),
    ServicesScreen(),
    BlogScreen(),
   
    ProfileDetails(),
    ServiceDetails(), // أضف صفحة التفاصيل
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(SIGChangeBottomNavBarState());
  }

  Future<List<BlogModel>> fetchBlogData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('blog').get();
      emit(SIGGetBlogsState());

      return querySnapshot.docs.map((doc) {
        return BlogModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      print('Error fetching blog data: $e');
      return [];
    }
  }

  List<BlogModel>? blogs;

  void getBlogData() async {
    blogs = await fetchBlogData();
    emit(SIGGetBlogsState());
  }

  Future<List<ServiceModel>> fetchServicesData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('services').get();

      return querySnapshot.docs.map((doc) {
        return ServiceModel.fromJson(doc.data());
      }).toList();
    } catch (e) {
      print('Error fetching categories data: $e');
      return [];
    }
  }

  List<ServiceModel>? services;
  void getServicesData() async {
    services = await fetchServicesData();
    emit(SIGGetServicesState());
  }
}
