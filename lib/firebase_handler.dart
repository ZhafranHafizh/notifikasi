import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseHandler {
  static FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  static void initialize(BuildContext context) {
    _firebaseMessaging.requestPermission();
    _firebaseMessaging.getToken().then((token) {
      print('Token: $token');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(notification.title ?? ""),
              content: Text(notification.body ?? ""),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
        );
      }

      // print("onMessageOpenedApp: $message");
      // Navigator.pushNamed(context, '/notification');
    });

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }
}
