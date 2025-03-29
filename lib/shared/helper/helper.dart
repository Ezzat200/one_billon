import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// String? sharedToken;

class AppConfig {
  static String? token;
  
}

String formatDate(String firebaseDateString) {
  // Parse the string into DateTime
  DateTime dateTime = DateFormat("MMMM d, y 'at' h:mm:ss a").parse(firebaseDateString);

  // Format it to desired format (e.g., 8 December 2024)
  String formatted = DateFormat('d MMMM y').format(dateTime);

  return formatted;
}

void navigateWithFade(BuildContext context, Widget page) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    ),
  );
}