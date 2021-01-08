import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:maintainance_tracker/screens/start.dart';
import 'package:maintainance_tracker/shared/loading.dart';
import 'package:maintainance_tracker/shared/phoneAuth.dart';

class AuthService {
  //Handles Auth
  handleAuth() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return LoadingPhone();
          } else {
            return StartPage();
          }
        });
  }

  //SignIn
  Future<void> signIn(AuthCredential authCreds) async {
    await FirebaseAuth.instance.signInWithCredential(authCreds);
  }
}
