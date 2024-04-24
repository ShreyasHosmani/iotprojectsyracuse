import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'helper.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> handleBgMessage(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
}

class AppNotificationWrapper extends StatefulWidget {
  const AppNotificationWrapper({Key? key, required this.child})
      : super(key: key);
  final Widget child;

  @override
  State<AppNotificationWrapper> createState() => _AppNotificationWrapperState();
}

class _AppNotificationWrapperState extends State<AppNotificationWrapper> {
  Future<void> _initNotification() async {
    await AppMessaging.init();
    await AppMessaging.handleNotification();
  }

  @override
  void initState() {
    super.initState();
    _initNotification();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class NotificationChannels {
  static const AndroidNotificationChannel androidChannel =
      AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.high,
    playSound: true,
  );

  static AndroidNotificationDetails androidChannelDetails =
      AndroidNotificationDetails(androidChannel.id, androidChannel.name,
          channelDescription: androidChannel.description,
          color: const Color(0xFF0F263B),
          priority: Priority.high,
          importance: Importance.high,
          playSound: true);

  static const DarwinNotificationDetails iOSChannel = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      threadIdentifier: 'iot_notification_thread'
  );
}

class AppMessaging {
  static FlutterLocalNotificationsPlugin localPlugin =
      FlutterLocalNotificationsPlugin();
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  // TEST Web FCM
  static Future<void> getFCMToken() async {
    await messaging.getToken(vapidKey: null).then((token) {
      print("TOKEN : "+token.toString());
      if (token != null) {
        fcmtoken = token;
      }
    });
  }

  /// Initialization
  ///
  /// Firebase initialization and its setup.
  /// Call `AppMessaging.init(context);` to initiate it.
  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );

    /// Request permission for iOS
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    /// If permission not granted, ask again
    if (settings.authorizationStatus == AuthorizationStatus.notDetermined ||
        settings.authorizationStatus == AuthorizationStatus.denied) {
      await Permission.notification.request();
    }

    /// By default foreground notificataions are hidden, set options for foreground notificataions
    await messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    /// Platform specific initialization settings
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = const DarwinInitializationSettings();

    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    localPlugin.initialize(initializationSettings);

    localPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );

    try {
      await getFCMToken();
      messaging.onTokenRefresh.listen((newToken) {
        fcmtoken = newToken;
      });
    } catch (e) {
      log(e);
    }
  }

  static Future<void> handleNotification() async {
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
  }
}
