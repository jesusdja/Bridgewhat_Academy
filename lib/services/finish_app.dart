import 'package:academybw/services/shared_preferences.dart';
import 'package:flutter/material.dart';

Future<void> finishApp() async{
  try{
    SharedPreferencesLocal.prefs.remove('AcademyLogin');
    SharedPreferencesLocal.prefs.remove('AcademyToken');
    debugPrint('TODO LIMPIO');
  }catch(e){
    debugPrint(e.toString());
  }
}