import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  log("message received! ${message.notification!.title}");
}

class NotificationService {

  static Future<void> initialize() async {
    NotificationSettings settings = await FirebaseMessaging.instance.requestPermission();
    if(settings.authorizationStatus == AuthorizationStatus.authorized) {
      
      String? token = await FirebaseMessaging.instance.getToken();
      if(token != null) {
        log(token);
      }

      FirebaseMessaging.onBackgroundMessage(backgroundHandler);

      log("Notifications Initialized!");
    }
  }

}