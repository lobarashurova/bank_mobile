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
    apiKey: 'AIzaSyBE0OR3i2dgeND7H7OwjiEnW0AvB3GB3GA',
    appId: '1:331937382683:web:8d69fe11e64fde51d393be',
    messagingSenderId: '331937382683',
    projectId: 'bank-systems-fa907',
    authDomain: 'bank-systems-fa907.firebaseapp.com',
    storageBucket: 'bank-systems-fa907.appspot.com',
    measurementId: 'G-WEG43K1FM1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA_NJtwuBCckSb5VRR1JWpQhjcOmG5jmg',
    appId: '1:331937382683:android:2913b10728ef9153d393be',
    messagingSenderId: '331937382683',
    projectId: 'bank-systems-fa907',
    storageBucket: 'bank-systems-fa907.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC7T-OoUFAr5Jyp2EKkDWAdSSrXpiEn_mQ',
    appId: '1:331937382683:ios:d0f78cecb9d0dc82d393be',
    messagingSenderId: '331937382683',
    projectId: 'bank-systems-fa907',
    storageBucket: 'bank-systems-fa907.appspot.com',
    iosBundleId: 'uz.solutionssquad.bankMobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC7T-OoUFAr5Jyp2EKkDWAdSSrXpiEn_mQ',
    appId: '1:331937382683:ios:89b878c6f74031bfd393be',
    messagingSenderId: '331937382683',
    projectId: 'bank-systems-fa907',
    storageBucket: 'bank-systems-fa907.appspot.com',
    iosBundleId: 'uz.solutionssquad.bankMobile.RunnerTests',
  );
}