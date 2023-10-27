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
        return macos;
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
    apiKey: 'AIzaSyAU1-lqhAJJ-B_EBcOLJg01_YqqYe31CvQ',
    appId: '1:991593401380:web:ba4b6d7dce598d8df39cb1',
    messagingSenderId: '991593401380',
    projectId: 'zartekproject',
    authDomain: 'zartekproject.firebaseapp.com',
    storageBucket: 'zartekproject.appspot.com',
    measurementId: 'G-D22BQDJB0D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCWlAuoCNLSjF8WJHhhl6sp1tBVeFKwqIA',
    appId: '1:991593401380:android:3a5a6d2187928ca9f39cb1',
    messagingSenderId: '991593401380',
    projectId: 'zartekproject',
    storageBucket: 'zartekproject.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOXsS_cn4ABMyF2Xog6kPjaeO-64pM_Is',
    appId: '1:991593401380:ios:bc31c9bfbe09e3dff39cb1',
    messagingSenderId: '991593401380',
    projectId: 'zartekproject',
    storageBucket: 'zartekproject.appspot.com',
    iosClientId: '991593401380-8gklrfv9r52ggkg1midbhta5h0auplip.apps.googleusercontent.com',
    iosBundleId: 'com.example.zartekWork',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCOXsS_cn4ABMyF2Xog6kPjaeO-64pM_Is',
    appId: '1:991593401380:ios:472c4e36619f399ff39cb1',
    messagingSenderId: '991593401380',
    projectId: 'zartekproject',
    storageBucket: 'zartekproject.appspot.com',
    iosClientId: '991593401380-h01fg1ir2hqhb3dd0dptfr32hsegl7eb.apps.googleusercontent.com',
    iosBundleId: 'com.example.zartekWork.RunnerTests',
  );
}