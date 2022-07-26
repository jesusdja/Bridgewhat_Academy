import 'dart:convert';

import 'package:academybw/services/apirest.dart';
import 'package:academybw/services/shared_preferences.dart';
import 'package:academybw/widgets_shared/toast_widget.dart';
import 'package:flutter/material.dart';

class HttpConnection{
  final Request _client = Request();
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest'
  };

  Future<bool> login({required String email,required String password}) async {
    try{
      final response = await _client.post(Uri.parse('login'),
          body: {"email": email, "password": password});
      Map<String,dynamic> value = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferencesLocal.prefs.setString('AcademyToken',value['success']['token']);
        return true;
      }else{
        String errorText = 'Error de conexión con el servidor';
        if(value.containsKey('error')){
          errorText = value['error'];
        }
        showAlert(text: errorText,isError: true);
      }
    }catch(e){
      debugPrint('HttpConnection-login ${e.toString()}');
      showAlert(text: 'Error de conexión con el servidor',isError: true);
    }
    return false;
  }

}