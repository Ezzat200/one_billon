import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/generated/l10n.dart';
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
    }

    // التنقل بعد النجاح
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LayoutScreen()),
      (route) => false,
    );

    ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        content: Text(S.of(context).login_success),
        backgroundColor: Colors.green,
      ),
    );

    emit(OneBillonLoginSuccessState());
  } on FirebaseAuthException catch (e) {
    String errorMsg;

    switch (e.code) {
    case 'user-not-found':
      errorMsg = S.of(context).user_not_found;
      break;
    case 'wrong-password':
      errorMsg = S.of(context).wrong_password;
      break;
    case 'invalid-email':
      errorMsg = S.of(context).invalid_email;
      break;
    case 'user-disabled':
      errorMsg = S.of(context).user_disabled;
      break;
    case 'too-many-requests':
      errorMsg = S.of(context).too_many_requests;
      break;
    case 'network-request-failed':
      errorMsg = S.of(context).network_request_failed;
      break;
    default:
      errorMsg = S.of(context).default_error;
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
       SnackBar(
        content: Text(S.of(context).unexpected_error),
        backgroundColor: Colors.red,
      ),
    );
  }
}
}
