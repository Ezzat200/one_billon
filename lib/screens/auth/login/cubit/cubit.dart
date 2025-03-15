import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_billon/screens/auth/login/cubit/states.dart';

class OneBillonLoginCubit extends Cubit<OneBillonLoginStates> {
  OneBillonLoginCubit() : super(OneBillonLoginInitialState());

  static OneBillonLoginCubit get(context) => BlocProvider.of(context);

Future<void> loginUser({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("✅ Logged in successfully!"),
        backgroundColor: Colors.green,
      ),
    );

    // Navigator.pushReplacement(...);

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
        // هنا المهم: نغطي الرسائل العامة الغريبة
        errorMsg = '❌ Incorrect email or password. Please try again.';
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMsg),
        backgroundColor: Colors.red,
      ),
    );
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
