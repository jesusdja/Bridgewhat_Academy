import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showAlert({required String text, bool isError = false}){
  Color color = isError ? Colors.redAccent : Colors.green;
  Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 3,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0
  );
}