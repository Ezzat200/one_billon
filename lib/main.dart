import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart'; // استيراد الباكيج
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:one_billon/firebase_options.dart';
import 'package:one_billon/generated/l10n.dart';
import 'package:one_billon/screens/auth/login/cubit/cubit.dart';
import 'package:one_billon/screens/auth/login/login_screen.dart';
import 'package:one_billon/screens/auth/regetser/cubit/cubit.dart';
import 'package:one_billon/screens/auth/regetser/regester_screen.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/layout.dart';
import 'package:one_billon/screens/services/service_form.dart';
import 'package:one_billon/shared/helper/helper.dart';
import 'package:one_billon/shared/network/firebase_message.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> subscribeToTopic() async {
  await FirebaseMessaging.instance.subscribeToTopic('all_users');
  log('Subscribed to all_users topic');
}

Future<void> loadToken() async {
  final prefs = await SharedPreferences.getInstance();
  AppConfig.token = prefs.getString('token');
}




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );




  await loadToken(); // Load user token

  runApp(
    DevicePreview(
      enabled: false, // تمكين DevicePreview
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
        BlocProvider(
            create: (context) => OneBillonCubit()
              ..getBlogData()
              ..getServicesData()..getServiceSections()),
        BlocProvider(create: (context) => OneBillonRegisterCubit()),
        BlocProvider(create: (context) => OneBillonLoginCubit()),
      ],
      child: MaterialApp(
        locale: const Locale('ar'), // اللغة الافتراضية

        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'Flutter Demo',
        builder: DevicePreview.appBuilder,
        useInheritedMediaQuery: true,
        initialRoute: '/',
        routes: {
          '/': (context) => LayoutScreen(),
        },
      ),
    );
  }
}
