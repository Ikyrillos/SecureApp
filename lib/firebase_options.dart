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
    apiKey: 'AIzaSyC0JR7W8SsKoS2b276D1_wmWPpjSEufyJg',
    appId: '1:703564389146:web:1430aa5a1f6a01e3b5aaa3',
    messagingSenderId: '703564389146',
    projectId: 'chat-app-a61c0',
    authDomain: 'chat-app-a61c0.firebaseapp.com',
    storageBucket: 'chat-app-a61c0.appspot.com',
    measurementId: 'G-TET6Z25NJ7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6-YQphJ54s4ImmK8hdrR2hdxyvk-cgx8',
    appId: '1:703564389146:android:42d0aa86f791c20bb5aaa3',
    messagingSenderId: '703564389146',
    projectId: 'chat-app-a61c0',
    storageBucket: 'chat-app-a61c0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnbtCdLszJLadGWWd10VUBAbmjEF2GwYo',
    appId: '1:703564389146:ios:10e98bb1ca06b002b5aaa3',
    messagingSenderId: '703564389146',
    projectId: 'chat-app-a61c0',
    storageBucket: 'chat-app-a61c0.appspot.com',
    iosClientId: '703564389146-90i7tfu81igqecvtis8phggeannq60b9.apps.googleusercontent.com',
    iosBundleId: 'com.example.secure',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnbtCdLszJLadGWWd10VUBAbmjEF2GwYo',
    appId: '1:703564389146:ios:10e98bb1ca06b002b5aaa3',
    messagingSenderId: '703564389146',
    projectId: 'chat-app-a61c0',
    storageBucket: 'chat-app-a61c0.appspot.com',
    iosClientId: '703564389146-90i7tfu81igqecvtis8phggeannq60b9.apps.googleusercontent.com',
    iosBundleId: 'com.example.secure',
  );
}