import 'dart:convert';

import 'package:academybw/services/apirest.dart';
import 'package:academybw/services/shared_preferences.dart';
import 'package:academybw/utils/get_data.dart';
import 'package:academybw/widgets_shared/toast_widget.dart';
import 'package:flutter/material.dart';

class HttpConnection{
  final Request _client = Request();
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'X-Requested-With': 'XMLHttpRequest'
  };

  Future<bool> login({required Map<String,dynamic> body}) async {
    try{
      final response = await _client.post(Uri.parse('login'), body: body);
      Map<String,dynamic> value = jsonDecode(response.body);
      if (response.statusCode == 200) {
        SharedPreferencesLocal.prefs.setString('AcademyToken',value['access_token']);
        return true;
      }else{
        String errorText = 'Server connection error';
        if(value.containsKey('message') && value['message'].toString().isNotEmpty){
          errorText = value['message'];
        }
        if(response.statusCode == 201 && value.containsKey('message')){
          errorText = 'the user has not been confirmed check your email';
        }
        showAlert(text: errorText,isError: true);
      }
    }catch(e){
      debugPrint('HttpConnection-login ${e.toString()}');
      showAlert(text: 'Server connection error',isError: true);
    }
    return false;
  }

  Future<bool> register({required Map<String,dynamic> body}) async {
    try{
      final response = await _client.post(Uri.parse('register'), body: body);

      Map<String,dynamic> value = jsonDecode(response.body);
      if (response.statusCode == 201) {
        //SharedPreferencesLocal.prefs.setString('AcademyToken',value['success']['token']);
        return true;
      }else{
        String errorText = 'Server connection error';
        if(value.containsKey('error')){
          errorText = value['error'];
        }
        showAlert(text: errorText,isError: true);
      }
    }catch(e){
      debugPrint('HttpConnection-login ${e.toString()}');
      showAlert(text: 'Server connection error',isError: true);
    }
    return false;
  }

  Future<bool> forgotPass({required Map<String,dynamic> body}) async {
    try{
      final response = await _client.post(Uri.parse('forgot-password'), body: body);
      Map<String,dynamic> value = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return true;
      }else{
        String errorText = 'Server connection error';
        if(value.containsKey('error')){
          errorText = value['error'];
        }
        if(response.statusCode == 201 && value.containsKey('message')){
          errorText = 'the user has not been confirmed check your email';
        }
        showAlert(text: errorText,isError: true);
      }
    }catch(e){
      debugPrint('HttpConnection-login ${e.toString()}');
      showAlert(text: 'Server connection error',isError: true);
    }
    return false;
  }

  Future<Map<String,dynamic>> getPostAll({required String pageNew}) async{
    Map<String,dynamic> data = {};
    headers['Authorization'] = getToken();
    try{
      final response = await _client.get(Uri.parse('posts/getList?$pageNew'),headers: headers);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
      }
    }catch(e){
      debugPrint('HttpConnection-login ${e.toString()}');
    }
    return data;
  }

  Future<Map<String,dynamic>> getCartoonsAll({required String pageNew}) async{
    Map<String,dynamic> data = {};
    headers['Authorization'] = getToken();
    try{
      final response = await _client.get(Uri.parse('cartoon/getList?$pageNew'),headers: headers);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
      }
    }catch(e){
      debugPrint('HttpConnection-login ${e.toString()}');
    }
    return data;
  }
}