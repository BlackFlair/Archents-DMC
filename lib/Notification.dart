import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification"),),
      body: Center(
        child: Text("Notification Page"),
      ),
    );
  }
}
