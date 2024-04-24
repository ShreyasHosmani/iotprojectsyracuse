// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAgfg5nW5H1wmqtQfanKwz53S_MQzQ2-Ec',
    appId: '1:189066804319:web:bc470709812cd6f0ec6fea',
    messagingSenderId: '189066804319',
    projectId: 'mayamaya-27975',
    authDomain: 'mayamaya-27975.firebaseapp.com',
    storageBucket: 'mayamaya-27975.appspot.com',
    measurementId: 'G-J31MQ9YV9C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyskcEmaN8-mvM0z07MCrhCp61Y7Gq-zc',
    appId: '1:189066804319:android:e077fe02eb95892bec6fea',
    messagingSenderId: '189066804319',
    projectId: 'mayamaya-27975',
    storageBucket: 'mayamaya-27975.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIt-OkSEGo-UKIpo9mvwMozgpu5oh83us',
    appId: '1:189066804319:ios:e7056c442a0a0907ec6fea',
    messagingSenderId: '189066804319',
    projectId: 'mayamaya-27975',
    storageBucket: 'mayamaya-27975.appspot.com',
    androidClientId: '189066804319-08pn76ejtcuk1kqgegve7ikuba67rjft.apps.googleusercontent.com',
    iosClientId: '189066804319-bs7f0ggkd0t8j4ph0taa9ln7gd6cuoth.apps.googleusercontent.com',
    iosBundleId: 'catenate.maya.maya.app',
  );
}
