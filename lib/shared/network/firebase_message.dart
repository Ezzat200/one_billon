
import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotification {
  // create instanse
  final firebaseMessagin = FirebaseMessaging.instance;

  //intilize notification
  Future<void> intilizeNotification() async {
    await firebaseMessagin.requestPermission();
    String? token = await firebaseMessagin.getToken();
    log("$token");
  }

  // handel notification
  void handelMassage(RemoteMessage? remotemess) {
    log("\n==================\n");
    print(remotemess);
    // navigatorKey.currentState?.pushNamed(Home.homeId, arguments: remotemess);
    // Navigator.push(context, MaterialPageRoute(
    //   builder: (context) {
    //     return HomePage();
    //   },
    // ));
  }

  // hande notification back greound
  Future<void> handelBackGround() async {
    firebaseMessagin.getInitialMessage().then(handelMassage);
    FirebaseMessaging.onMessageOpenedApp.listen(handelMassage);
  }
}