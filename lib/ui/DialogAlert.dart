import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tornado/theme.dart';

import '../generated/l10n.dart';

class DialogAlert {
  static void removeConfirm(BuildContext context, VoidCallback onPressed) {
    confirm(context, onOk: onPressed, title: S.of(context).confirm, desc: S.of(context).confirm_delete);
  }

  static void openConfirm(BuildContext context, VoidCallback onPressed) {
    confirm(context, onOk: onPressed, title: S.of(context).confirm, desc: S.of(context).confirm_open);
  }

  static void connectBlueToothConfirm(BuildContext context, VoidCallback onPressed) {
    confirm(context, onOk: onPressed, title: S.of(context).confirm, desc: S.of(context).confirm_connect_bluetooth);
  }

  static void unSavedConfirm(BuildContext context, VoidCallback onPressed, {VoidCallback? onCancelBefore}) {
    confirm(context, onOk: onPressed, title: S.of(context).save, desc: S.of(context).confirm_unsaved, onCancelBefore: onCancelBefore);
  }

  static void confirm(BuildContext context, {required VoidCallback onOk, String? okText, VoidCallback? onCancelBefore, required String title, String? desc}) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(title: Text(title), content: desc != null ? Text(desc) : null, actions: <Widget>[
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  if (onCancelBefore != null) {
                    onCancelBefore();
                  }
                },
                child: Text(S.of(context).cancel, style: Theme.of(context).textTheme.titleSmall)),
            CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  onOk();
                },
                child: Text(okText ?? S.of(context).ok, style: Theme.of(context).textTheme.titleSmall))
          ]);
        });
  }
}
