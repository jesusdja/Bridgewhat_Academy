import 'dart:io';

import 'package:academybw/main.dart';
import 'package:academybw/services/shared_preferences.dart';
import 'package:dio/dio.dart';
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

    downloadVideos();
  }

  Future downloadVideos() async{

    for(int x = 1; x < 21; x++){
      try {
        String fullPath = tempPath + "/video_log_$x.mp4";
        File file = File(fullPath);
        bool res = await file.exists();
        if(!res){
          var dio = Dio();
          debugPrint('INICIANDO DESCARGA VIDEO LOG_$x.mp4');
          Response response = await dio.get(
            'https://bridgewhat.ole.agency/videos/LOG_$x.mp4',
            options: Options(
                responseType: ResponseType.bytes,
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }),
          );
          var raf = file.openSync(mode: FileMode.write);
          raf.writeFromSync(response.data);
          await raf.close();
          debugPrint('DESCARGA COMPLETA VIDEO LOG_$x.mp4');
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }

  }
}
