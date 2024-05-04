import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:raudhatul_muhabbah/extentions/string_extentions.dart';

class NotificationUtils {
  static late FirebaseMessaging messaging;
  static AndroidNotificationChannel? channel;
  static FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  static late String firebaseToken;

  static initFirebase() async {
    await Firebase.initializeApp();

    messaging = FirebaseMessaging.instance;

    notificationSettings();
     getFirebaseToken();
    listenForegroundMessage();
    listenBackgroundMessage();
    setupChannel();
  }

  /// Require for IOS & MacOS
  static notificationSettings() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (kDebugMode) {
      print('User granted permission: ${settings.authorizationStatus}');
    }
  }

  ///    Firebase Messaging
  static Future<String?> getFirebaseToken() async {
    final fcmToken = await messaging.getToken();

    print("Firebase token --------------> $fcmToken");
    if (kDebugMode) {
      "Firebase token --------------> $fcmToken".printSuccess();
    }
    firebaseToken=fcmToken ?? "";
    return fcmToken;
  }

  ///    Firebase Background Messages
  static Future<void> listenBackgroundMessage() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  /// Setup Channel
  static setupChannel() async {
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
          'flutter_notification', // id
          'flutter_notification_title', // title
          importance: Importance.high,
          enableLights: true,
          enableVibration: true,
          showBadge: true,
          playSound: true);

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      const android = AndroidInitializationSettings('@drawable/app_icon');
      const iOS = DarwinInitializationSettings();
      const initSettings = InitializationSettings(android: android, iOS: iOS);

      await flutterLocalNotificationsPlugin?.initialize(
          initSettings,
          onDidReceiveNotificationResponse: notificationTapBackground,
          onDidReceiveBackgroundNotificationResponse: notificationTapBackground
      );

      await messaging.setForegroundNotificationPresentationOptions(alert: true, badge: true, sound: true,);
    }
  }

  static listenForegroundMessage() {
    FirebaseMessaging.onMessage.listen((message) async {
      ('Received message in foreground!').printSuccess();
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null && !kIsWeb) {
        String action = jsonEncode(message.data);

        flutterLocalNotificationsPlugin?.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel!.id,
                channel!.name,
                priority: Priority.high,
                importance: Importance.max,
                setAsGroupSummary: true,
                styleInformation: const DefaultStyleInformation(true, true),
                largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
                channelShowBadge: true,
                autoCancel: true,
                icon: '@drawable/app_icon_awn',
              ),
            ),
            payload: action);
      }
    });
  }

  static listenInitialMessage() {
    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if (kDebugMode) {
        print('Received message in foreground!');
        print('Message data: ${event?.data ?? ""}');
        print('Message data: ${event?.notification?.body ?? ""}');
      }
      if (event?.notification != null) {
        if (kDebugMode) {
          print(
              'Message also contained a notification: ${event?.notification?.title ?? ""}');
          print(
              'Message also contained a notification: ${event?.notification?.body ?? ""}');
        }
      }
    });
  }

//
//
// void localNotification(){
//   //Notification Work
//   LocalNotifications.startMethod();
//   //this is for terminate state
//   FirebaseMessaging.instance.getInitialMessage().then((event) {
//     print('Got a terminate state for  in the foreground!');
//     print('Message data: ${event?.data ?? ""}');
//     if (event?.notification != null) {
//       print(
//           'Message also contained a notification: ${event?.notification?.body ?? ""}');
//       print(
//           'Message also contained a notification: ${event?.notification?.title ?? ""}');
//       LocalNotifications.showNotificationOnForeground(event!);
//     }
//   });
//   //this is for foreground state
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     print('Got a message for  in the foreground!');
//     print('Message data: ${message.data ?? ""}');
//
//     if (message.notification != null) {
//       print(
//           'Message also contained a notification : ${message.notification?.body ?? ""}');
//       print(
//           'Message also contained a notification: ${message.notification?.title ?? ""}');
//       // showMessage(context: context, msg: "${message.notification?.title  ??""  }\n ");
//       LocalNotifications.showNotificationOnForeground(message);
//     }
//   });
//
//
//
//   //this for background state to manage state of notification
//   FirebaseMessaging.onMessageOpenedApp.listen((event) {
//     print('Got a message for  in the foreground!');
//     print('Message data: ${event.data ?? ""}');
//
//     if (event.notification != null) {
//
//
//       LocalNotifications.showNotificationOnForeground(event);
//
//       print(
//           'Message also contained a notification: ${event.notification?.body ?? ""}');
//       print(
//           'Message also contained a notification: ${event.notification?.title ?? ""}');
//     }
//   });
//   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     RemoteNotification? notification = message.notification;
//     AndroidNotification? android = message.notification?.android;
//     FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin= FlutterLocalNotificationsPlugin();
//
//     // If `onMessage` is triggered with a notification, construct our own
//     // local notification to show to users using the created channel.
//     if (notification != null && android != null) {
//       flutterLocalNotificationsPlugin.show(
//           notification.hashCode,
//           notification.title,
//           notification.body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               " channel.id",
//               "channel.name",
//               // "channel.description",
//               icon: android.smallIcon,
//               // other properties...
//             ),
//           ));
//     }
//   });
//
//   requestPermission();
//   //  Notification Work
// }
// void requestPermission() async {
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//   NotificationSettings settings = await firebaseMessaging.requestPermission(
//     alert: true,
//     announcement: false,
//     badge: false,
//     carPlay: false,
//     criticalAlert: false,
//     provisional: false,
//     sound: false,
//   );
//   print('User granted permission: ${settings.authorizationStatus}');
// }
//

  static final NotificationUtils _singleton = NotificationUtils._internal();

  factory NotificationUtils() {
    return _singleton;
  }

  NotificationUtils._internal();
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void notificationTapBackground(NotificationResponse notificationResponse) {
  'notification(${notificationResponse.id}) action tapped: ${notificationResponse.actionId} with payload: ${notificationResponse.payload}'
      .printSuccess();
  if (notificationResponse.input?.isNotEmpty ?? false) {
    'notification action tapped with input: ${notificationResponse.input}'
        .printSuccess();
  }
}
