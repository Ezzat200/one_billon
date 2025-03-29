import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider, Cubit;
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/models/blog_model.dart';
import 'package:one_billon/models/service_model.dart';
import 'package:one_billon/screens/blog/blog_screen.dart';
import 'package:one_billon/screens/home/home.dart';
import 'package:one_billon/screens/layout/cubit/states.dart';
import 'package:one_billon/screens/profile/profile_details.dart';
import 'package:one_billon/screens/profile/profile_screen.dart';
import 'package:one_billon/screens/section/sections_screen.dart';
import 'package:one_billon/screens/services/service_details.dart';
import 'package:one_billon/screens/services/services_screen.dart';
import 'package:one_billon/shared/helper/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OneBillonCubit extends Cubit<OneBillonStates> {
  OneBillonCubit() : super(SIGInitialState());

  static OneBillonCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  void openServiceDetails(BuildContext context, ServiceModel service) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ServiceDetails(
                serviceModel: service,
              )),
    );
  }

  String languageCode = 'ar';

  List<Widget> screens = [
    Home(),
    SectionsScreen(),
    ServicesScreen(),
    
    BlogScreen(),

    // ProfileScreen(),

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
    // print(services![0].featuresAr);
    log("Hello");
    log("${services?[0].featuresAr}");
    emit(SIGGetServicesState());
  }

  Future<void> submitOrder({
    required String name,
    required String email,
    required String phone,
    required String service,
  }) async {
    try {
      emit(StratSendUserDataState());

      await FirebaseFirestore.instance.collection('orders').add({
        'name': name,
        'email': email,
        'phone': phone,
        'service': service,
        'timestamp': FieldValue.serverTimestamp(),
      });
      emit(SendUserDataSuccessState());
      print("Order submitted successfully!");
    } catch (e) {
      emit(SendUserDataErrorState());
      print("Error submitting order: $e");
      rethrow;
    }
  }

  Future<void> logout() async {
    AppConfig.token = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    await FirebaseAuth.instance.signOut();

    emit(LogOutState());
  }

  Future<void> deleteAccount(context) async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    String email = '';
    String password = '';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(S.of(context).deleteAccountConfirm),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => email = value,
                decoration: InputDecoration(labelText: S.of(context).email),
              ),
              TextField(
                onChanged: (value) => password = value,
                decoration: InputDecoration(labelText: S.of(context).password),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(S.of(context).cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(S.of(context).confirm),
            ),
          ],
        );
      },
    ).then((confirmed) async {
      if (confirmed == true && user != null) {
        try {
          final cred =
              EmailAuthProvider.credential(email: email, password: password);
          await user.reauthenticateWithCredential(cred);

          // حذف من Firestore
          await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .delete();

          // حذف من Firebase Auth
          await user.delete();

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(S.of(context).accountDeleted),
                backgroundColor: Colors.green),
          );

          // خروج بعد الحذف
          OneBillonCubit.get(context).logout();

          emit(AccountDeleteSuccessState());


        } on FirebaseAuthException catch (e) {
          String message;
          if (e.code == 'user-mismatch' ||
              e.code == 'user-not-found' ||
              e.code == 'wrong-password') {
            message = S.of(context).invalidCredentials;
          } else if (e.code == 'requires-recent-login') {
            message = S.of(context).reloginToDelete;
          } else {
            message = S.of(context).somethingWentWrong;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: Colors.red),
          );

          emit(AccountDeleteErrorState());
        }
      }
    });
  }
}
