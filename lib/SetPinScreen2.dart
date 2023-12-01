import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:otms/DashboardScreen.dart';
import 'package:otms/utils/Utils.dart';

class SetPinScreen2 extends StatefulWidget {
  SetPinScreen2({Key? key}) : super(key: key);

  @override
  SetPinState2 createState() => SetPinState2();
}

class SetPinState2 extends State<SetPinScreen2> {
  bool saving = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController box1 = TextEditingController();
  TextEditingController box2 = TextEditingController();
  TextEditingController box3 = TextEditingController();
  TextEditingController box4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
        body: ModalProgressHUD(
            inAsyncCall: saving,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.white,
              child: Column(children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Form(
                        key: formKey,
                        child: ListView(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/img_set_pin_header.svg',
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Text(
                                  "Quick Login?\nEnter 4 Digit Code",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'PlusJakartaSans',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28,
                                  )),
                            ),
                            SizedBox(height: 36),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffc6c6c6)),
                                        borderRadius: BorderRadius.circular(4)),
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
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffc6c6c6)),
                                        borderRadius: BorderRadius.circular(4)),
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
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffc6c6c6)),
                                        borderRadius: BorderRadius.circular(4)),
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
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xffc6c6c6)),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        if (value.isEmpty) {
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
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {

                                      // Navigator.pushReplacement(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) =>
                                      //           LoginScreen()),
                                      // );
                                    },
                                    child: Text(
                                      "Not you?",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'PlusJakartaSans',
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // resetLoginPin(Utils.userInfo?.id);
                                    },
                                    child: Text("Forgot Code",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'PlusJakartaSans',
                                        )),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                              child: MaterialButton(
                                onPressed: () {
                                  if (box1.text.toString().isNotEmpty &&
                                      box2.text.toString().isNotEmpty &&
                                      box3.text.toString().isNotEmpty &&
                                      box4.text.toString().isNotEmpty) {
                                    // if (Utils.userInfo?.is_mpin == 1) {
                                    //   quickLogin(
                                    //       Utils.userInfo?.id,
                                    //       box1.text.toString() +
                                    //           box2.text.toString() +
                                    //           box3.text.toString() +
                                    //           box4.text.toString());
                                    // } else {
                                    //   setLoginPin(
                                    //       Utils.userInfo?.id,
                                    //       box1.text.toString() +
                                    //           box2.text.toString() +
                                    //           box3.text.toString() +
                                    //           box4.text.toString());
                                    // }
                                  } else {
                                    Utils.showToastShort(context, "Enter OTP");
                                  }
                                },
                                color: Color(0xff1D67F1),
                                elevation: 0,
                                height: 48,
                                splashColor: Colors.white.withAlpha(30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4)),
                                child: Text("SUBMIT",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'PlusJakartaSans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
              ]),
            )));
  }

  // void quickLogin(String? userId, String mPin) async {
  //   if (formKey.currentState!.validate()) {
  //     showProgress();
  //     LoginResponse? loginResponse =
  //         await RemoteService().quickLogin(userId!, mPin);
  //     hideProgress();
  //     if (loginResponse != null) {
  //       if (loginResponse.isSuccess) {
  //         var userdata = json.encode(loginResponse.Data);
  //         Map<String, dynamic> userMap = jsonDecode(userdata);
  //         Utils.userInfo = UserInfo.fromJson(userMap);
  //         Utils.saveLoginData(userdata);
  //         moveToDashboardScreen();
  //       } else {
  //         if (!mounted) return;
  //         Utils.handleUnauthorized(context, loginResponse.Message);
  //       }
  //     }
  //   }
  // }

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

  void moveToDashboardScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DashboardScreen()),
    );
  }
}
