import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    RemoteMessage message = ModalRoute.of(context)?.settings.arguments as RemoteMessage;
    return Scaffold(
      body: Column(
        children: [
          Text('${message.notification?.title}'),
          Text('${message.notification?.body}'),
          Text('${message.data}')
        ],
      ),
    );
  }
}
