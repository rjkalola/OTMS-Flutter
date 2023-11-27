import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:otms/custom_widget/PrimaryButton.dart';
import 'package:otms/service/authorization.dart';
import 'package:otms/utils/colors.dart';
import 'package:otms/utils/utils.dart';

import 'model/DropDownValuesResponse.dart';
import 'model/login_response.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  bool saving = false;
  String phoneExtension = "+91";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController box1 = TextEditingController();
  TextEditingController box2 = TextEditingController();
  TextEditingController box3 = TextEditingController();
  TextEditingController box4 = TextEditingController();
  TextEditingController box5 = TextEditingController();
  TextEditingController box6 = TextEditingController();

  void showProgress() {
    setState(() {
      saving = true;
    });
  }

  void hideProgress() {
    setState(() {
      saving = false;
    });
  }

  @override
  void initState() {
    showProgress();
    getDropDownDataResponse();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: saving,
        child: Scaffold(
          backgroundColor: backgroundColor,
          body: Column(children: [
            Form(
              key: formKey,
              child: Expanded(
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
                                "Verify Otp",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500),
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
                        padding: const EdgeInsets.fromLTRB(16, 30, 16, 20),
                        child: Text("Enter the four-digit code that you were sent over mobile SMS.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: defaultAccentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              controller: box1,
                              textAlign: TextAlign.center,
                              textAlignVertical:
                              TextAlignVertical.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: <TextInputFormatter>[
                                // for below version 2 use this
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'))
                              ],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context)
                                      .previousFocus();
                                }
                              },
                              controller: box2,
                              textAlign: TextAlign.center,
                              textAlignVertical:
                              TextAlignVertical.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: <TextInputFormatter>[
                                // for below version 2 use this
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'))
                              ],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context)
                                      .previousFocus();
                                }
                              },
                              controller: box3,
                              textAlign: TextAlign.center,
                              textAlignVertical:
                              TextAlignVertical.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: <TextInputFormatter>[
                                // for below version 2 use this
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'))
                              ],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context)
                                      .previousFocus();
                                }
                              },
                              controller: box4,
                              textAlign: TextAlign.center,
                              textAlignVertical:
                              TextAlignVertical.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: <TextInputFormatter>[
                                // for below version 2 use this
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'))
                              ],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context)
                                      .previousFocus();
                                }
                              },
                              controller: box5,
                              textAlign: TextAlign.center,
                              textAlignVertical:
                              TextAlignVertical.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              inputFormatters: <TextInputFormatter>[
                                // for below version 2 use this
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'))
                              ],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 50,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  FocusScope.of(context)
                                      .previousFocus();
                                }
                              },
                              controller: box6,
                              textAlign: TextAlign.center,
                              textAlignVertical:
                              TextAlignVertical.center,
                              maxLength: 1,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              inputFormatters: <TextInputFormatter>[
                                // for below version 2 use this
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]'))
                              ],
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                  fontFamily: 'PlusJakartaSans',
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                          text: 'Click On ',
                          style: const TextStyle(fontSize: 14, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Resend',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    debugPrint('The button is clicked!');
                                  },
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w500
                                )),
                            const TextSpan(text: ' if you do not receive after 2 minutes'),
                          ],
                        )
                    )
                  ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 60,
              color: defaultAccentColor,
              child: MaterialButton(
                onPressed: () {
                  signUp();
                },
                color: defaultAccentColor,
                elevation: 0,
                height: 60,
                splashColor: Colors.white.withAlpha(30),
                child: Text("Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    )),
              ),
            )
          ]),
        ),
      ),
    );
  }

  void signUp() async {
    // if (formKey.currentState!.validate()) {
      // String firstName = firstNameController.text.toString().trim();
      // String lastName = lastNameController.text.toString().trim();
      // String phoneNumber = phoneNumberController.text.toString().trim();
    //   LoginResponse? response = await RemoteService().signUp(firstName, lastName, phoneNumber, phoneExtension);
    //   hideProgress();
    //   if (response != null) {
    //     print("Status:${response.statusCode}");
    //     print(response.toJson().toString());
    //     if (response.statusCode == 200) {
    //
    //     } else {
    //       Utils.showToastShort(context, response.error);
    //       // Utils.handleUnauthorized(context, response.Message);
    //     }
    //   }
    // }
  }

  void getDropDownDataResponse() async {
    DropDownValuesResponse? response = await RemoteService().getDropDownData();
    hideProgress();
    if (response != null) {
      print("Status:${response.statusCode}");
      print(response.toJson().toString());
      if (response.statusCode == 200) {
      } else {
        // Utils.handleUnauthorized(context, response.Message);
      }
    }
  }
}
