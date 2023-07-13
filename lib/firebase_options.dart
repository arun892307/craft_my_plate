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
    apiKey: 'AIzaSyCoHwY2HTL1IQZmnMD3xgyERybSKqmsEKg',
    appId: '1:558116208470:web:c81903a67636ba5c34e0f7',
    messagingSenderId: '558116208470',
    projectId: 'craft-my-plate',
    authDomain: 'craft-my-plate.firebaseapp.com',
    storageBucket: 'craft-my-plate.appspot.com',
    measurementId: 'G-MZCT8BD1QJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBQYC0j36I-Le2rCRw_3rVJGDfhpRenzKo',
    appId: '1:558116208470:android:66c045a533e932d534e0f7',
    messagingSenderId: '558116208470',
    projectId: 'craft-my-plate',
    storageBucket: 'craft-my-plate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA50ZFNR1edcE4vpdLWhPtvSlmjEkPkAZ0',
    appId: '1:558116208470:ios:62569e81e201afa134e0f7',
    messagingSenderId: '558116208470',
    projectId: 'craft-my-plate',
    storageBucket: 'craft-my-plate.appspot.com',
    iosClientId: '558116208470-dmm27vgm2sr4bdkqe9u1fm97uqdfi3r4.apps.googleusercontent.com',
    iosBundleId: 'com.example.craftMyPlate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA50ZFNR1edcE4vpdLWhPtvSlmjEkPkAZ0',
    appId: '1:558116208470:ios:62569e81e201afa134e0f7',
    messagingSenderId: '558116208470',
    projectId: 'craft-my-plate',
    storageBucket: 'craft-my-plate.appspot.com',
    iosClientId: '558116208470-dmm27vgm2sr4bdkqe9u1fm97uqdfi3r4.apps.googleusercontent.com',
    iosBundleId: 'com.example.craftMyPlate',
  );
}
