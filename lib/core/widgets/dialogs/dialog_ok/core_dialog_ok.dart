// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../router/app_router.dart';

class CoreDialogOk extends StatelessWidget {
  final String title;
  final String msg;
  final IconData? icon;
  const CoreDialogOk({super.key, required this.title, required this.msg, this.icon});

  show(BuildContext context) async => await showDialog(context: context, builder: build);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: icon == null ? null : Icon(icon),
      title: Text(title),
      content: Text(msg),
      actions: [TextButton(onPressed: AppRouter.pop, child: Text("Ok"))],
    );
  }
}
