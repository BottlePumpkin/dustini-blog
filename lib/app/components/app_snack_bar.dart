


import 'package:dustini_blog/main.dart';
import 'package:flutter/material.dart';

class AppSnackBar {
  AppSnackBar._();


 static void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    scaffoldMessengerStateKey.currentState?.showSnackBar(snackBar);
  }


}