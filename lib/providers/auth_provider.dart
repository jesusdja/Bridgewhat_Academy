import 'package:academybw/services/shared_preferences.dart';
import 'package:flutter/material.dart';

enum AuthStatus {splash,login,home,}

class AuthProvider extends ChangeNotifier {

  AuthStatus authStatus = AuthStatus.splash;

  AuthProvider() {
    isAuthenticated();
  }

  Future isAuthenticated() async {
    bool isLogin = SharedPreferencesLocal.prefs.getBool('AcademyLogin') ?? true;
    authStatus = isLogin ? AuthStatus.login : AuthStatus.home;
    notifyListeners();
  }
}
