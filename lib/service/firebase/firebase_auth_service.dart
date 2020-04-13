import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

  Future<FirebaseUser> authenticateUser() async {
    final authResult =  await FirebaseAuth.instance.signInAnonymously();
    return authResult.user;
  }
}