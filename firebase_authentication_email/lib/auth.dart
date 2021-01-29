import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  FirebaseAuth firebaseAuth;
  User _user;
  GoogleSignIn _googleSignIn;

  Auth() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  bool isLoggedIn() {
    this._user = firebaseAuth.currentUser;

    if (this._user == null) {
      return false;
    }
    return true;
  }

  Future<User> signInWithGoogle() async {
    this._googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        // 'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    final GoogleSignInAccount googleSignInAccount =
        await this._googleSignIn.signIn();

    User user;

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await this.firebaseAuth.signInWithCredential(credential);
    user = authResult.user;

    return user;
  }

  Future<void> signOutGoogle() async {
    await this._googleSignIn.signOut();
  }

  Future<void> signOut() async {
    await this.firebaseAuth.signOut();
  }

  StreamSubscription<User> listen(Function fn) {
    final listener = this.firebaseAuth.authStateChanges().listen((user) {
      fn(user);
    });

    return listener;
  }

  Future<void> forgetPassword(String email) async {
    await this.firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
