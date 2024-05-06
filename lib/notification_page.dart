import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
      ),
      body: Center(
        child: Text(
          'This is the Notification Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
