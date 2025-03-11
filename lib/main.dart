import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart'; // استيراد الباكيج
import 'package:one_billon/firebase_options.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/layout.dart';
import 'package:one_billon/shared/network/firebase_message.dart';


// void getFCMToken() async {
//   String? token = await FirebaseMessaging.instance.getToken();
//   print("FCM Token: $token"); // اطبعه في الـ console لاستخدامه في إرسال الإشعارات
// }

Future<void> subscribeToTopic() async {
  await FirebaseMessaging.instance.subscribeToTopic('all_users');
  log('Subscribed to all_users topic');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp(
    DevicePreview(
      enabled: true, // تمكين DevicePreview
      builder: (context) => const MyApp(), // بناء التطبيق داخل DevicePreview
    ),
  );
   await FirebaseNotification().handelBackGround();
  await subscribeToTopic();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OneBillonCubit()..getBlogData()..getServicesData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: DevicePreview.appBuilder,
        useInheritedMediaQuery: true,
        initialRoute: '/',
        routes: {
          '/': (context) => const LayoutScreen(),
        },
      ),
    );
  }
}
