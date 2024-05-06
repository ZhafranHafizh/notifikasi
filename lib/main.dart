import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:tp_mod11/app.dart';
import 'package:tp_mod11/firebase_handler.dart'; // Import FirebaseHandler

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan inisialisasi Flutter sudah selesai
  await Firebase.initializeApp(); // Inisialisasi Firebase
  runApp(MyApp(navigatorKey));
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    initializeFirebaseHandler();
  });
}

void initializeFirebaseHandler() {
  BuildContext context = navigatorKey.currentContext!;
  FirebaseHandler.initialize(context);
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
