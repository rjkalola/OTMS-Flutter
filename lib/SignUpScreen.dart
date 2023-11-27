import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otms/custom_widget/PrimaryButton.dart';
import 'package:otms/utils/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(14, 18, 0, 0),
                  child: Stack(
                    children: const <Widget>[
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.black, fontSize: 17),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 30, 0, 0),
                    child: Text("Signup free and start\nusing OTM System",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: defaultAccentColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      Flexible(
                        flex: 1,
                        child: TextField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          cursorColor: defaultAccentColor,
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            labelText: 'First Name',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: defaultAccentColor),
                            // ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: defaultAccentColor),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 1,
                        child: TextField(
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.done,
                          cursorColor: defaultAccentColor,
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            labelText: 'Last Name',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: defaultAccentColor),
                            // ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: defaultAccentColor),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 0, 0),
                    child: Text("Phone Number",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 12,
                        )),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/img_india_flag.jpg',
                        height: 40,
                        width: 30,
                      ),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 24,
                      color: Color(0xff000000),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                      child: Text("+91",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 18, 0),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.done,
                          cursorColor: defaultAccentColor,
                          decoration: InputDecoration(
                            hintText: 'Phone',
                            labelStyle: TextStyle(color: Colors.grey),
                            hintStyle:
                                TextStyle(fontSize: 15, color: Colors.grey),
                            // enabledBorder: UnderlineInputBorder(
                            //   borderSide: BorderSide(color: defaultAccentColor),
                            // ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: defaultAccentColor),
                            ),
                          ),
                          inputFormatters: <TextInputFormatter>[
                            // for below version 2 use this
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
          ),
          Container(
            width: double.infinity,
            height: 48,
            color: defaultAccentColor,
            child: MaterialButton(
              onPressed: () {},
              color: defaultAccentColor,
              elevation: 0,
              height: 48,
              splashColor: Colors.white.withAlpha(30),
              child: Text("Sign Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  )),
            ),
          )
        ]),
      ),
    );
  }
}
