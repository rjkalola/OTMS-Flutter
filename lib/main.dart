import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otms/LoginScreen.dart';
import 'package:otms/SignUpScreen.dart';
import 'package:otms/SplashScreen.dart';

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
      home: LoginScreen(),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}
