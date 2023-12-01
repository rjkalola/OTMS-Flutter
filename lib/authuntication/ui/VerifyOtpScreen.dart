import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:otms/DashboardScreen.dart';
import 'package:otms/utils/colors.dart';

import '../../model/DropDownValuesResponse.dart';
import '../../model/LoginResponse.dart';
import '../../utils/Utils.dart';
import '../data/authorization_service.dart';

class VerifyOtpScreen extends StatefulWidget {
  final String extension, phoneNumber;

  const VerifyOtpScreen(
      {super.key, required this.extension, required this.phoneNumber});

  @override
  State<VerifyOtpScreen> createState() =>
      _VerifyOtpScreenState(extension, phoneNumber);
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  String extension, phoneNumber;

  _VerifyOtpScreenState(this.extension, this.phoneNumber);

  bool saving = false;
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
    print("Extension:" + extension);
    print("phoneNumber:" + phoneNumber);
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
                      padding: EdgeInsets.fromLTRB(14, 18, 0, 0),
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Verify Otp",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: InkWell(
                              child: Icon(
                                Icons.arrow_back,
                                size: 24,
                                color: Color(0xff000000),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(16, 30, 16, 22),
                        child: Text(
                            "Enter the four-digit code that you were sent over mobile SMS.",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: defaultAccentColor,
                                fontSize: 19,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 44,
                            height: 56,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              controller: box1,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
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
                                  fontWeight: FontWeight.w500),
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
                            width: 44,
                            height: 56,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              controller: box2,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
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
                                  fontWeight: FontWeight.w500),
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
                            width: 44,
                            height: 56,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              controller: box3,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
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
                                  fontWeight: FontWeight.w500),
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
                            width: 44,
                            height: 56,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              controller: box4,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
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
                                  fontWeight: FontWeight.w500),
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
                            width: 44,
                            height: 56,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              controller: box5,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
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
                                  fontWeight: FontWeight.w500),
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
                            width: 44,
                            height: 56,
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffc6c6c6)),
                                borderRadius: BorderRadius.circular(0)),
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              controller: box6,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
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
                                  fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 28,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: RichText(
                          text: TextSpan(
                            text: 'Click On ',
                            style:
                            const TextStyle(fontSize: 14, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Resend,',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      resendOTP();
                                    },
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: defaultAccentColor,
                                      fontWeight: FontWeight.w500)),
                              const TextSpan(
                                  text: ' if you do not receive after 2 minutes'),
                            ],
                          )),
                    )
                  ]),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              color: defaultAccentColor,
              child: MaterialButton(
                onPressed: () {
                  if (box1.text
                      .toString()
                      .isNotEmpty &&
                      box2.text
                          .toString()
                          .isNotEmpty &&
                      box3.text
                          .toString()
                          .isNotEmpty &&
                      box4.text
                          .toString()
                          .isNotEmpty &&
                      box5.text
                          .toString()
                          .isNotEmpty &&
                      box6.text
                          .toString()
                          .isNotEmpty) {
                    verifyOTP(box1.text.toString() +
                        box2.text.toString() +
                        box3.text.toString() +
                        box4.text.toString() +
                        box5.text.toString() +
                        box6.text.toString());
                  } else {
                    Utils.showSnackBarMessage(context, "Enter OTP");
                  }
                },
                color: defaultAccentColor,
                elevation: 0,
                height: 50,
                splashColor: Colors.white.withAlpha(30),
                child: Text("Submit",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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

  void resendOTP() async {
    if (formKey.currentState!.validate()) {
      showProgress();
      LoginResponse? response =
      await RemoteService().login(phoneNumber, extension);
      hideProgress();
      if (response != null) {
        if (response.statusCode == 200) {} else {
          if (context.mounted) {
            Utils.showSnackBarMessage(context, response.detail!);
          }
        }
      }
    }
  }

  void verifyOTP(String otp) async {
    if (formKey.currentState!.validate()) {
      showProgress();
      LoginResponse? response =
      await RemoteService().verifyOTP(phoneNumber, extension, otp);
      hideProgress();
      if (response != null) {
        if (response.statusCode == 200) {
          Utils.saveAccessToken(response.access_token!);
          if (context.mounted) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => DashboardScreen()
                ),
                ModalRoute.withName("/Home")
            );
          }
        }else {
          if (context.mounted) {
            Utils.showSnackBarMessage(context, response.detail!);
          }
        }
      }
    }
  }
}
