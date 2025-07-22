import 'package:bom_hamburguer/main.dart';
import 'package:flutter/material.dart';

class CoreSnackBars {
  static success(String msg) async {
    if (scaffoldMessengerKey.currentState == null) return;
    await Future.delayed(Duration(milliseconds: 300));

    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        duration: Duration(seconds: 1),
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

  static error(String msg) async {
    if (scaffoldMessengerKey.currentState == null) return;
    await Future.delayed(Duration(milliseconds: 300));
    return scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 10,
        duration: Duration(seconds: 1),
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
