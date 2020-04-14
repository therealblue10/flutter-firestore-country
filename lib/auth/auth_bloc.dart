import 'dart:async';
import 'package:country/service/firebase/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthBloc extends ChangeNotifier {

  final _authController = StreamController<bool>();
  final _authUserController = StreamController<FirebaseUser>();
  final _firebaseAuthService = FirebaseAuthService();

  Stream<bool> subscribeToStream() {
    logInUser();
    return _authController.stream;
  }

  void logInUser() {
    _firebaseAuthService.authenticateUser().then((user) {
      final isSignedIn = user != null;
      _authController.sink.add(isSignedIn);
      _authUserController.sink.add(user);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _authController.close();
    _authUserController.close();
  }
}