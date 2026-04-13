import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = FirebaseFirestore.instance;
  static final _googleSignIn = GoogleSignIn();

  // ── Get current user ──────────────────────────────────────────────────
  static User? get currentUser => _auth.currentUser;

  // ── Email / Password Register ─────────────────────────────────────────
  static Future<UserCredential> register(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    // Save user profile to Firestore
    await _firestore.collection('users').doc(cred.user!.uid).set({
      'email': email.trim(),
      'createdAt': FieldValue.serverTimestamp(),
    });

    return cred;
  }

  // ── Email / Password Login ────────────────────────────────────────────
  static Future<UserCredential> login(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  }

  // ── Google Sign-In ────────────────────────────────────────────────────
  static Future<UserCredential?> signInWithGoogle() async {
    if (kIsWeb) {
      // Web: use popup
      final provider = GoogleAuthProvider();
      return await _auth.signInWithPopup(provider);
    } else {
      // Android / iOS
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null; // cancelled

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final result = await _auth.signInWithCredential(credential);

      // Save to Firestore if new user
      final doc = _firestore.collection('users').doc(result.user!.uid);
      final snap = await doc.get();
      if (!snap.exists) {
        await doc.set({
          'email': result.user!.email,
          'name': result.user!.displayName,
          'photoUrl': result.user!.photoURL,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
      return result;
    }
  }

  // ── Logout ────────────────────────────────────────────────────────────
  static Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}