import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart'; // استيراد الباكيج
import 'package:one_billon/screens/auth/login/login_screen.dart';
import 'package:one_billon/shared/enums/languageEventType.dart';
import 'package:one_billon/lang/lang_cubit.dart';
import 'package:one_billon/screens/layout/cubit/cubit.dart';
import 'package:one_billon/screens/layout/layout.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // تمكين DevicePreview
      builder: (context) => const MyApp(), // بناء التطبيق داخل DevicePreview
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OneBillonCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: DevicePreview.appBuilder, 
        useInheritedMediaQuery: true, 
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
        },
      ),
    );
  }
}
