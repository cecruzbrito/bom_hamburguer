import 'package:flutter/material.dart';

import '../../../main.dart';
import 'dialog_ok/core_dialog_ok.dart';

class CoreDialogs {
  static Future<void> showDialogOKError(String title, String msg) async {
    if (navigatorKey.currentContext == null) return;

    CoreDialogOk(title: title, msg: msg, icon: Icons.warning).show(navigatorKey.currentContext!);
  }
}
