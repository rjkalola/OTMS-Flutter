import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otms/authuntication/ui/HomeTab.dart';
import 'package:otms/utils/colors.dart';

import 'SplashScreen.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "OTMS App",
      home: HomeTab(),
      theme: ThemeData(primarySwatch: Colors.lightBlue,scaffoldBackgroundColor: backgroundColor),
    );
  }
}
