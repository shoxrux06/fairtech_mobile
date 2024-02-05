import 'package:fairtech_mobile/src/config/router/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('title ** ${message.notification?.title} **');
  print('data ** ${message.notification?.body} **');
  print('data ** ${message.data} **');
}

class FirebaseApi {
  final firebaseMessaging = FirebaseMessaging.instance;

  handleMessage(RemoteMessage? message) {
    if (message == null) return;
    rootNavigatorKey.currentState?.pushNamed(
      Routes.pushNotification,
      arguments: message,
    );
  }

  Future initPushNotifications() async{
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
    firebaseMessaging.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
  Future initNotifications() async {
    await firebaseMessaging.requestPermission();
    final fcmToken = await firebaseMessaging.getToken();
    print('fcmToken ** $fcmToken **');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    initPushNotifications();
  }
}
