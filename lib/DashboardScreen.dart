import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otms/authuntication/ui/LoginScreen.dart';
import 'package:otms/utils/AlertDialogHelper.dart';
import 'package:otms/utils/AppConstants.dart';
import 'package:otms/utils/Utils.dart';
import 'package:otms/utils/interfaces/DialogButtonClickListener.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return DashboardScreenState();
  }
}

class DashboardScreenState extends State<DashboardScreen> implements DialogButtonClickListener{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
              child: InkWell(
            child: Text(
              "Logout",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
            onTap: () {
              AlertDialogHelper.showAlertDialog(context, "", "Are you sure you want to logout?", "Yes", "No", true, this, AppConstants.dialogIdentifier.logout);
            },
          )),
        ));
  }

  @override
  void onNegativeButtonClicked(String dialogIdentifier) {
    if(dialogIdentifier == AppConstants.dialogIdentifier.logout){
      Navigator.of(context).pop(); //
    }
  }

  @override
  void onPositiveButtonClicked(String dialogIdentifier) {
    if(dialogIdentifier == AppConstants.dialogIdentifier.logout){
      Utils.saveAccessToken("");
      Navigator.of(context).pop(); //
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => LoginScreen()
            ),
            ModalRoute.withName("")
        );
      }

    }
  }


}
