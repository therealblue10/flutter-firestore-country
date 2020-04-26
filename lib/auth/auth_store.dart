import 'package:country/service/firebase/firebase_auth_service.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;


abstract class _AuthStore with Store {

  final _firebaseAuthService = FirebaseAuthService();

  @observable
  bool isAuthenticated = false;

  @action
  void authenticateUser() {
    print('Authenticating user...');
    _firebaseAuthService.authenticateUser().then((user){
      print('user auth received...');
        isAuthenticated = user != null;
    });
  }
}