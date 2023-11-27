import 'dart:developer';

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

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool saving = false;
  DropDownValuesResponse? dropDownValuesResponse;
  String phoneExtension = "+91";

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final _focusColor = Colors.blue; // use your own colors
  final _nonFocusColor = Colors.grey;
  Color _phoneNumberFieldColor = Colors.grey;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                                "Sign Up",
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
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: firstNameController,
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
                                    RegExp("[a-zA-Z]")),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Flexible(
                            flex: 1,
                            child: TextFormField(
                              controller: lastNameController,
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
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
                                    RegExp("[a-zA-Z]")),
                              ],
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
                            child: Focus(
                              onFocusChange: (hasFocus) {
                                setState(() => _phoneNumberFieldColor =
                                    hasFocus ? _focusColor : _nonFocusColor);
                              },
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.done,
                                cursorColor: defaultAccentColor,
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                  hintText: 'Phone',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintStyle: TextStyle(
                                      fontSize: 15, color: Colors.grey),
                                  // enabledBorder: UnderlineInputBorder(
                                  //   borderSide: BorderSide(color: defaultAccentColor),
                                  // ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: defaultAccentColor),
                                  ),
                                ),
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: "Required Field"),
                                  MinLengthValidator(10,
                                      errorText:
                                          "Phone number must contain 10 digits")
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
                  signUp();
                },
                color: defaultAccentColor,
                elevation: 0,
                height: 50,
                splashColor: Colors.white.withAlpha(30),
                child: Text("Sign Up",
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
    if (formKey.currentState!.validate()) {
      String firstName = firstNameController.text.toString().trim();
      String lastName = lastNameController.text.toString().trim();
      String phoneNumber = phoneNumberController.text.toString().trim();
      LoginResponse? response = await RemoteService().signUp(firstName, lastName, phoneNumber, phoneExtension);
      hideProgress();
      if (response != null) {
        print("Status:${response.statusCode}");
        print(response.toJson().toString());
        if (response.statusCode == 200) {

        } else {
          Utils.showToastShort(context, response.error);
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
