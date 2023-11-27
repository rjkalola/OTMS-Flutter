import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:otms/custom_widget/PrimaryButton.dart';
import 'package:otms/model/DropDownValuesResponse.dart';
import 'package:otms/model/login_response.dart';
import 'package:otms/service/authorization.dart';
import 'package:otms/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool saving = false;
  DropDownValuesResponse? dropDownValuesResponse;

  TextEditingController phoneController = TextEditingController();
  final _focusColor = Colors.blue; // use your own colors
  final _nonFocusColor = Colors.grey;
  Color _phoneNumberFieldColor = Colors.grey;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(14, 18, 0, 0),
                    child: Stack(
                      children: const <Widget>[
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Log In",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17,fontWeight: FontWeight.w500),
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
                          child: Focus(
                            onFocusChange: (hasFocus) {
                              setState(() => _phoneNumberFieldColor =
                                  hasFocus ? _focusColor : _nonFocusColor);
                            },
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.done,
                              cursorColor: defaultAccentColor,
                              controller: phoneController,
                              decoration: InputDecoration(
                                hintText: 'Phone',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintStyle:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                                // enabledBorder: UnderlineInputBorder(
                                //   borderSide: BorderSide(color: defaultAccentColor),
                                // ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: defaultAccentColor),
                                ),
                              ),
                              validator: MultiValidator([
                                RequiredValidator(errorText: "Required Field"),
                              ]),
                              inputFormatters: <TextInputFormatter>[
                                // for below version 2 use this
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')),
                                LengthLimitingTextInputFormatter(10),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 28, 16, 14),
                      child: PrimaryButton(
                        buttonText: 'Login with OTP',
                        onPressed: () {
                          log(phoneController.text.toString().trim());
                          login(phoneController.text.toString().trim());
                          log('data: onPressed');
                        },
                      ),
                    ),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    "Don\'t have an account?",
                    style: TextStyle(
                      color: Color(0xff737373),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color(0xff0065ff),
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

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

  void login(String phoneNumber) async {
    if (formKey.currentState!.validate()) {
      LoginResponse? response = await RemoteService().login(phoneNumber, "+91");
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

  void getDropDownDataResponse() async {
    DropDownValuesResponse? response = await RemoteService().getDropDownData();
    hideProgress();
    if (response != null) {
      print("Status:${response.statusCode}");
      print(response.toJson().toString());
      if (response.statusCode == 200) {
        dropDownValuesResponse = response;
      } else {
        // Utils.handleUnauthorized(context, response.Message);
      }
    }
  }

}
