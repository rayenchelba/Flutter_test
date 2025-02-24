// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDTQlp8M_KHbqJ4UKv-YE5bThkTQjBL-9Q',
    appId: '1:662683932258:web:df0282e78d7624014c633b',
    messagingSenderId: '662683932258',
    projectId: 'test-7989b',
    authDomain: 'test-7989b.firebaseapp.com',
    storageBucket: 'test-7989b.firebasestorage.app',
    measurementId: 'G-JDC393BX8Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxrnNv0ICcfhDNU2d1rI-7F-OKBgga6f8',
    appId: '1:149663720240:android:c27ae865920a9836f85ef5',
    messagingSenderId: '149663720240',
    projectId: 'app-33033',
    storageBucket: 'app-33033.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC1gq5WixnD0WVWzkFUholcbfSee-cGvAQ',
    appId: '1:149663720240:ios:d83821cc299ab2b1f85ef5',
    messagingSenderId: '149663720240',
    projectId: 'app-33033',
    storageBucket: 'app-33033.firebasestorage.app',
    iosBundleId: 'com.example.test3',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBO4Ku061L8ssD0WinxB_0TKAt8ATTamc4',
    appId: '1:662683932258:ios:e8b6cb6267a37ef24c633b',
    messagingSenderId: '662683932258',
    projectId: 'test-7989b',
    storageBucket: 'test-7989b.firebasestorage.app',
    iosBundleId: 'com.example.test3',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDTQlp8M_KHbqJ4UKv-YE5bThkTQjBL-9Q',
    appId: '1:662683932258:web:0c46bfc77239f0a24c633b',
    messagingSenderId: '662683932258',
    projectId: 'test-7989b',
    authDomain: 'test-7989b.firebaseapp.com',
    storageBucket: 'test-7989b.firebasestorage.app',
    measurementId: 'G-FCDVFS8WTZ',
  );
}