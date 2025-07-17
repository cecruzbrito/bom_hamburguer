import 'package:bom_hamburguer/main.dart';
import 'package:flutter/material.dart';

class CoreSnackBars {
  static success(String msg) {
    if (scaffoldMessengerKey.currentState == null) return;
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(msg, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
      ),
    );
  }

  static error(String msg) {
    if (scaffoldMessengerKey.currentState == null) return;
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(msg, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ),
    );
  }
}
