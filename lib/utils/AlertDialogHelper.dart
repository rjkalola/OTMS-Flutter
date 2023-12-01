import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'interfaces/DialogButtonClickListener.dart';

class AlertDialogHelper {
  static showAlertDialog(
      BuildContext context,
      String title,
      String message,
      String textPositiveButton,
      String textNegativeButton,
      bool isCancelable,
      final DialogButtonClickListener? buttonClickListener,
      final String dialogIdentifier) {
    // set up the buttons
    List<Widget> listButtons = [];
    if (textNegativeButton.isNotEmpty) {
      Widget cancelButton = TextButton(
        child: Text(textNegativeButton),
        onPressed: () {
          if (buttonClickListener == null) {
            Navigator.of(context).pop(); // dismiss dialog
          } else {
            buttonClickListener.onNegativeButtonClicked(dialogIdentifier);
          }
        },
      );
      listButtons.add(cancelButton);
    }

    if (textPositiveButton.isNotEmpty) {
      Widget continueButton = TextButton(
        child: Text(textPositiveButton),
        onPressed: () {
          if (buttonClickListener == null) {
            Navigator.of(context).pop(); // dismiss dialog
          } else {
            buttonClickListener.onPositiveButtonClicked(dialogIdentifier);
          }
        },
      );
      listButtons.add(continueButton);
    }
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: title.isNotEmpty?Text(title):null,
      content: message.isNotEmpty?Text(message):null,
      actions: listButtons,
    );
    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: isCancelable,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
