import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/user_interface/loading_screen.dart';
import 'package:untitled/wrapper/app_notification.dart';
import 'package:untitled/wrapper/firebase_options.dart';
import 'package:untitled/wrapper/helper.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("45af4226-9b1a-4051-aae8-95bbf30aea13");

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);
  // Firebasse initialization
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  FlutterLocalNotificationsPlugin localPlugin =
  FlutterLocalNotificationsPlugin();
  FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
    RemoteNotification? notification = message?.notification;
    await localPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(NotificationChannels.androidChannel);

    log('*' * 20);
    log("Title: ${notification?.title}");
    log("Body: ${notification?.body}");
    log('*' * 20);

    if (notification != null) {
      await localPlugin.show(
        notification.title.hashCode + DateTime.now().hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: NotificationChannels.androidChannelDetails,
          iOS: NotificationChannels.iOSChannel,
        ),
        payload: '',
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    if (kDebugMode) {
      log('*' * 20);
      log("Title: ${message.notification?.title}");
      log("Body: ${message.notification?.body}");
      log('*' * 20);
    }
  });
  FirebaseMessaging.onBackgroundMessage(handleBgMessage);
  await AppMessaging.localPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(NotificationChannels.androidChannel);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:  AppNotificationWrapper(child: LoadingScreen()),
  );
}