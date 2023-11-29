import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:otms/utils/colors.dart';
import 'package:otms/utils/utils.dart';

import '../../model/DropDownValuesResponse.dart';
import '../../model/LoginResponse.dart';
import '../../model/PhoneExtensionInfo.dart';
import '../data/authorization_service.dart';
import '../interface/SelectPhoneExtensionListener.dart';
import 'VerifyOtpScreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> implements SelectPhoneExtensionListener{
  bool saving = false;
  DropDownValuesResponse? dropDownValuesResponse;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final _focusColor = Colors.blue; // use your own colors
  final _nonFocusColor = Colors.grey;
  Color _phoneNumberFieldColor = Colors.grey;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var items = <PhoneExtensionInfo>[];
  var mFlag =
      "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";
  var mExtension = "+91";

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
        opacity: 0,
        progressIndicator: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: defaultAccentColor,
        ),
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
                      padding: const EdgeInsets.fromLTRB(6, 15, 0, 0),
                      child: Stack(
                        children:  <Widget>[
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Sign Up",
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
                              child: Padding(
                                padding:  EdgeInsets.fromLTRB(8,3,8,0),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 24,
                                  color: Color(0xff000000),
                                ),
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
                        padding: const EdgeInsets.fromLTRB(16, 30, 0, 0),
                        child: Text("Signup free and start\nusing OTM System",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: defaultAccentColor,
                                fontSize: 21,
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
                              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                hintText: 'First Name',
                                labelText: 'First Name',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintStyle:
                                    TextStyle(fontSize: 16, color: Colors.grey),
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
                              style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.normal),
                              decoration: InputDecoration(
                                hintText: 'Last Name',
                                labelText: 'Last Name',
                                labelStyle: TextStyle(color: Colors.grey),
                                hintStyle:
                                    TextStyle(fontSize: 16, color: Colors.grey),
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
                        InkWell(
                          child: Row(children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(16, 0, 0, 0),
                              child: Image.memory(
                                Base64Decoder().convert(mFlag),
                                width: 38,
                              ),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 24,
                              color: Color(0xff000000),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                              child: Text(mExtension,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  )),
                            ),
                          ]),
                          onTap: () {
                            showDropdownDialog(
                                "phone_extension",
                                "Select phone extension",
                                dropDownValuesResponse!.extensions!,
                                this);
                          },
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
                                style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.normal),
                                decoration: InputDecoration(
                                  hintText: 'Phone',
                                  labelStyle: TextStyle(color: Colors.grey),
                                  hintStyle: TextStyle(
                                      fontSize: 16, color: Colors.grey),
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
      LoginResponse? response = await RemoteService().signUp(firstName, lastName, phoneNumber, mExtension);
      hideProgress();
      if (response != null) {
        print("Status:${response.statusCode}");
        print(response.toJson().toString());
        if (response.statusCode == 200) {
          if (context.mounted) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return VerifyOtpScreen(
                  extension: mExtension, phoneNumber: phoneNumber);
            }));
          }
        } else {
          if (context.mounted) {
            Utils.showSnackBarMessage(context, response.error!);
          }
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

  void showDropdownDialog(String dialogType, String title,
      List<PhoneExtensionInfo> list, SelectPhoneExtensionListener listener) {
    items.clear();
    items.addAll(list);
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      /* shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),*/
      context: context,
      builder: (context) => StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) =>
              DraggableScrollableSheet(
                initialChildSize: 0.9,
                maxChildSize: 0.9,
                minChildSize: 0.5,
                builder:
                    (BuildContext context, ScrollController scrollController) =>
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                      child: Column(mainAxisSize: MainAxisSize.max, children: [
                        Container(
                          decoration: BoxDecoration(
                              color: titleBgColor,
                              borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.centerRight,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.close, size: 20),
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
                          child: TextField(
                            onChanged: (value) {
                              setModalState(() {
                                filterSearchResults(value, list);
                              });
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(0, 2, 14, 0),
                              prefixIcon: Icon(Icons.search, color: Colors.black26),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffbab8b8), width: 1.3),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xffbab8b8), width: 1.3),
                              ),
                              hintText: 'Search',
                            ),
                          ),
                        ),
                        Expanded(child: setDropDownList(dialogType, listener))
                      ]),
                    ),
              )),
    );
  }

  Widget setDropDownList(
      String dialogType, SelectPhoneExtensionListener listener) =>
      ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return ListTile(
            onTap: () {
              listener.onSelectPhoneExtension(
                  items[i].extension!, items[i].flag!);
              Navigator.pop(context);
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(3, 1, 3, 1),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.memory(
                          Base64Decoder().convert(items[i].flag!),
                          width: 38,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          items[i].extension!,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'PlusJakartaSans',
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                ),
                // Divider()
              ],
            ),
          );
        },
      );

  void filterSearchResults(String query, List<PhoneExtensionInfo> list) {
    List<PhoneExtensionInfo> dummySearchList = <PhoneExtensionInfo>[];
    dummySearchList.addAll(list);
    if (query.isNotEmpty) {
      List<PhoneExtensionInfo> dummyListData = <PhoneExtensionInfo>[];
      for (var item in dummySearchList) {
        if (item.extension!.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(list);
      });
    }
  }

  @override
  void onSelectPhoneExtension(String extension, String flag) {
    setState(() {
      mFlag = flag;
      mExtension = extension;
    });
  }
}
