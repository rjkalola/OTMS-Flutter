import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otms/authuntication/ui/LoginScreen.dart';
import 'package:otms/utils/AppConstants.dart';
import 'package:otms/utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashboardScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefValue) => {
      setState(() {
        var token = prefValue.getString(AppConstants.sharedPreferenceKey.keyAccessToken) ?? "";
        Future.delayed(const Duration(seconds: 3), () {
          if (token.isEmpty) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else {
            // Map<String, dynamic> userMap = jsonDecode(userdata);
            // Utils.userInfo = UserInfo.fromJson(userMap);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          }
        });
      })
    });
    // setState(() {
    //   Future.delayed(const Duration(seconds: 4), () {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => LoginScreen()),
    //     );
    //   });
    // });
    super.initState();
  }

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
              child: Image.asset(
            'assets/images/img_splash_logo.jpg',
            height: 350,
            width: 350,
          )),
        ));
  }
}
