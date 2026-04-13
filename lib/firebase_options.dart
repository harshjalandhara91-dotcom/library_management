// File generated manually for Firebase project: library-management-a21eb
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
      case TargetPlatform.windows:
        return windows;
      default:
        return web;
    }
  }

  // ── Web ───────────────────────────────────────────────────────────────
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCOIAxf9rg5OKzKbsLyqX9r8DPKN6Sw1RQ',
    appId: '1:318880877839:web:404b075cc107aa4725827a',
    messagingSenderId: '318880877839',
    projectId: 'library-management-a21eb',
    authDomain: 'library-management-a21eb.firebaseapp.com',
    storageBucket: 'library-management-a21eb.firebasestorage.app',
    measurementId: 'G-GXV1LDMHTN',
  );

  // ── Android ───────────────────────────────────────────────────────────
  // After adding Android app in Firebase Console and downloading
  // google-services.json, replace appId with the correct Android appId.
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCOIAxf9rg5OKzKbsLyqX9r8DPKN6Sw1RQ',
    appId: '1:318880877839:web:404b075cc107aa4725827a',
    messagingSenderId: '318880877839',
    projectId: 'library-management-a21eb',
    storageBucket: 'library-management-a21eb.firebasestorage.app',
  );

  // ── iOS ───────────────────────────────────────────────────────────────
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOIAxf9rg5OKzKbsLyqX9r8DPKN6Sw1RQ',
    appId: '1:318880877839:web:404b075cc107aa4725827a',
    messagingSenderId: '318880877839',
    projectId: 'library-management-a21eb',
    storageBucket: 'library-management-a21eb.firebasestorage.app',
    iosBundleId: 'com.example.pro2',
  );

  // ── Windows ───────────────────────────────────────────────────────────
  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCOIAxf9rg5OKzKbsLyqX9r8DPKN6Sw1RQ',
    appId: '1:318880877839:web:404b075cc107aa4725827a',
    messagingSenderId: '318880877839',
    projectId: 'library-management-a21eb',
    authDomain: 'library-management-a21eb.firebaseapp.com',
    storageBucket: 'library-management-a21eb.firebasestorage.app',
  );
}
