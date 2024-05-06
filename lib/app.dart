import 'package:flutter/material.dart';
import 'package:tp_mod11/home_page.dart';
import 'package:tp_mod11/notification_page.dart';

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  MyApp(this.navigatorKey);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/notification': (context) => NotificationPage(),
      },
    );
  }
}
