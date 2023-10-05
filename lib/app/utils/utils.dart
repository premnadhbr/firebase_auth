import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<ScaffoldMessengerState> messKey =
      GlobalKey<ScaffoldMessengerState>();

  static showSnackBar(String text) {
  
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text));

    messKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
