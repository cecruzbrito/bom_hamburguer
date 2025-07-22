import 'package:bom_hamburguer/main.dart';
import 'package:flutter/material.dart';

class CoreSnackBars {
  static success(String msg) {
    if (scaffoldMessengerKey.currentState == null) return;
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        elevation: 10,
        duration: Duration(milliseconds: 800),
        content: Row(
          spacing: 10,
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            Flexible(child: Text(msg)),
          ],
        ),
      ),
    );
  }

  static error(String msg) {
    if (scaffoldMessengerKey.currentState == null) return;
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        elevation: 10,
        duration: Duration(milliseconds: 800),
        content: Row(
          spacing: 10,
          children: [
            Icon(Icons.cancel, color: Colors.red),
            Flexible(child: Text(msg)),
          ],
        ),
      ),
    );
  }
}
