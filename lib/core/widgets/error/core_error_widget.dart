// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../mixins/padding/padding_app.dart';

class CoreErrorWidget extends StatelessWidget with PaddingApp {
  CoreErrorWidget({super.key, required this.desc, required this.title, required this.type, this.button});
  final String title;
  final String desc;
  final TypeError type;
  final ButtonEntity? button;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: paddingScrollDefault,
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(type.asset, height: 100, width: 100),
            Text(title, style: Theme.of(context).textTheme.headlineMedium),
            Text(desc, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
            if (button != null)
              ElevatedButton.icon(onPressed: button?.onTap, icon: Icon(button?.icon), label: Text(button!.label)),
          ],
        ),
      ),
    );
  }
}

class ButtonEntity {
  final String label;
  final IconData icon;
  final Function() onTap;

  ButtonEntity({required this.label, required this.icon, required this.onTap});

  factory ButtonEntity.tryAgain(Function() onTap) =>
      ButtonEntity(icon: Icons.refresh, label: "Try again", onTap: onTap);
}

enum TypeError {
  warning,
  canceled;

  String get asset => switch (this) {
    TypeError.warning => "assets/icons/warning.webp",
    TypeError.canceled => "assets/icons/cancel.webp",
  };
}
