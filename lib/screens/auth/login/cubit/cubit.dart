import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/screens/auth/login/cubit/states.dart';
import 'package:one_billon/screens/layout/layout.dart';
import 'package:one_billon/shared/helper/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OneBillonLoginCubit extends Cubit<OneBillonLoginStates> {
  OneBillonLoginCubit() : super(OneBillonLoginInitialState());

  static OneBillonLoginCubit get(context) => BlocProvider.of(context);

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

 
Future<void> loginUser({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    // تسجيل الدخول
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    // الحصول على الـ token
    String? token = await userCredential.user?.getIdToken();

    if (token != null) {
      // تخزين الـ token في SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      AppConfig.token = token;
      print('🔥 Token saved: $token');
    }

    // التنقل بعد النجاح
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LayoutScreen()),
      (route) => false,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("✅ Logged in successfully!"),
        backgroundColor: Colors.green,
      ),
    );

    emit(OneBillonLoginSuccessState());
  } on FirebaseAuthException catch (e) {
    String errorMsg;

    switch (e.code) {
      case 'user-not-found':
        errorMsg = '❌ No user found for that email.';
        break;
      case 'wrong-password':
        errorMsg = '❌ Wrong password provided.';
        break;
      case 'invalid-email':
        errorMsg = '❌ Email address is not valid.';
        break;
      case 'user-disabled':
        errorMsg = '❌ This user account has been disabled.';
        break;
      case 'too-many-requests':
        errorMsg = '❌ Too many attempts. Try again later.';
        break;
      case 'network-request-failed':
        errorMsg = '❌ No internet connection.';
        break;
      default:
        errorMsg = '❌ Incorrect email or password. Please try again.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMsg),
        backgroundColor: Colors.red,
      ),
    );
    emit(OneBillonLoginErrorState());
    
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("❌ An unexpected error occurred."),
        backgroundColor: Colors.red,
      ),
    );
  }
}
}
