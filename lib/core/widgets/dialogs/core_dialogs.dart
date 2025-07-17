import 'package:bom_hamburguer/core/router/app_router.dart';
import 'package:bom_hamburguer/core/widgets/dialogs/dialog_ok/core_dialog_ok.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class CoreDialogs {
  static Future<void> showDialogOKError(String title, String msg) async {
    if (navigatorKey.currentContext == null) return;

    CoreDialogOk(title: title, msg: msg, icon: Icons.warning).show(navigatorKey.currentContext!);
  }
}
