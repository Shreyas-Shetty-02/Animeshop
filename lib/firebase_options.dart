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
    apiKey: 'AIzaSyALwXPHac53byN5GlRyMxreNRadQpEb5wo',
    appId: '1:604894720617:web:4349e3162026e0017368f8',
    messagingSenderId: '604894720617',
    projectId: 'flutter-52d3d',
    authDomain: 'flutter-52d3d.firebaseapp.com',
    storageBucket: 'flutter-52d3d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBgSO6JdangUXzpNt0MTWCPn39r7jXrCGg',
    appId: '1:604894720617:android:61e58fe97256e71e7368f8',
    messagingSenderId: '604894720617',
    projectId: 'flutter-52d3d',
    storageBucket: 'flutter-52d3d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLS7f3MxnYFC0Crc2FJzToes19N02kdNc',
    appId: '1:604894720617:ios:04561464dd0aa0bc7368f8',
    messagingSenderId: '604894720617',
    projectId: 'flutter-52d3d',
    storageBucket: 'flutter-52d3d.appspot.com',
    iosClientId: '604894720617-02o7etfp3b4rg97j2fua7oqp1ib9v7m6.apps.googleusercontent.com',
    iosBundleId: 'com.example.animeshop',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLS7f3MxnYFC0Crc2FJzToes19N02kdNc',
    appId: '1:604894720617:ios:a4d9327975a4cded7368f8',
    messagingSenderId: '604894720617',
    projectId: 'flutter-52d3d',
    storageBucket: 'flutter-52d3d.appspot.com',
    iosClientId: '604894720617-frdmqvda3glu3d4f2s0fkp2vsubt486a.apps.googleusercontent.com',
    iosBundleId: 'com.example.animeshop.RunnerTests',
  );
}
