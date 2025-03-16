import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/screens/auth/login/login_screen.dart';
import 'package:one_billon/screens/auth/regetser/cubit/states.dart';

class OneBillonRegisterCubit extends Cubit<OneBillonRegisterStates> {
  OneBillonRegisterCubit() : super(OneBillonRegisterInitialState());

  static OneBillonRegisterCubit get(context) => BlocProvider.of(context);

  Future<void> registerUser({
    required String name,
    required String email,
    required String phone,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // إنشاء حساب باستخدام Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // إضافة بيانات إضافية للمستخدم في Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
        'phone': phone,
        'uid': userCredential.user!.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });

      // نجاح التسجيل
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Account created successfully!")),
      );

      // ممكن تعمل Navigate بعد التسجيل لو حبيت
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    } on FirebaseAuthException catch (e) {
      String errorMsg = '';
      if (e.code == 'email-already-in-use') {
        errorMsg = 'This email is already in use.';
      } else if (e.code == 'weak-password') {
        errorMsg = 'The password provided is too weak.';
      } else {
        errorMsg = e.message ?? 'Something went wrong.';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred.")),
      );
    }
  }
}
