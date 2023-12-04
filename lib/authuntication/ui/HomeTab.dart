import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:otms/authuntication/ui/SignUpScreen.dart';
import 'package:otms/authuntication/ui/VerifyOtpScreen.dart';
import 'package:otms/custom_widget/PrimaryButton.dart';
import 'package:otms/model/DropDownValuesResponse.dart';
import 'package:otms/model/LoginResponse.dart';
import 'package:otms/utils/AppConstants.dart';
import '../../model/DashboardActionItemInfo.dart';
import '../../utils/Utils.dart';
import '../data/authorization_service.dart';
import 'package:otms/utils/colors.dart';

import '../../model/PhoneExtensionInfo.dart';
import '../interface/SelectPhoneExtensionListener.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool isProgress = false, isMainViewVisible = true;
  final _controller = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    // showProgress();
    setHeaderActionButtons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isProgress,
        child: Scaffold(
          backgroundColor: Color(0xfff4f5f7),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 9, 16, 0),
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "https://www.pngmart.com/files/22/User-Avatar-Profile-PNG-Isolated-Transparent-Picture.png",
                    fit: BoxFit.scaleDown,
                    height: 48,
                    width: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text("Welcome, Ravi Kalola",
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16, 6, 16, 0),
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6))),
              child: SingleChildScrollView(
                child: Column(children: [
                  PageView(
                    controller: _controller,
                    children: const [
                      MyPage1Widget(),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Today’s Appointments",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff1D67F1),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'PlusJakartaSans',
                          ),
                        ),
                        Row(children: [
                          TextButton(
                              onPressed: () => {},
                              child: Text("See All",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff828282),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlusJakartaSans',
                                  ))),
                          Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 14,
                              color: Color(0xff828282),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 7, 16, 0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Wednesday , 17th August",
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff828282),
                            fontWeight: FontWeight.w500,
                            fontFamily: 'PlusJakartaSans',
                          )),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xffECF2FE),
                        border: Border.all(
                          width: 0.2,
                          color: Color(0xff1D67F1),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(4))),
                    margin: EdgeInsets.fromLTRB(16, 15, 16, 9),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 11),
                              child: Text(
                                "No Appointments Today",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff808080),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'PlusJakartaSans',
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF2F2F2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          margin: EdgeInsets.fromLTRB(16, 7, 16, 7),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 16, 15, 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/ic_calender.svg',
                                          width: 22),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 11),
                                        child: Text(
                                          "Jane Cooper",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff333333),
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'PlusJakartaSans',
                                          ),
                                        ),
                                      )
                                    ]),
                                Text(
                                  "12:45 PM  -  01:00 PM",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff1D67F1),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'PlusJakartaSans',
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void showProgress() {
    setState(() {
      isProgress = true;
    });
  }

  void hideProgress() {
    setState(() {
      isProgress = false;
    });
  }

  void setHeaderActionButtons() {
    var arrayItems = <DashboardActionItemInfo>[];

    DashboardActionItemInfo? info;

    info = DashboardActionItemInfo();
    info.id = AppConstants.action.clockIn;
    info.title = "Clock In";
    info.image = "";
    info.backgroundColor = "#f8dbd6";
    arrayItems.add(info);

    info = DashboardActionItemInfo();
    info.id = AppConstants.action.quickTask;
    info.title = "Tasks";
    info.image = "";
    info.backgroundColor = "#f8dbd6";
    arrayItems.add(info);

    info = DashboardActionItemInfo();
    info.id = AppConstants.action.map;
    info.title = "Map";
    info.image = "";
    info.backgroundColor = "#f8dbd6";
    arrayItems.add(info);

    info = DashboardActionItemInfo();
    info.id = AppConstants.action.teams;
    info.title = "Teams";
    info.image = "";
    info.backgroundColor = "#f8dbd6";
    arrayItems.add(info);

    List<List<DashboardActionItemInfo>> chunks = _generateChunks(arrayItems, 3);
    print("List Size:${chunks.length}");
  }

  List<List<DashboardActionItemInfo>> _generateChunks<T>(
      List<DashboardActionItemInfo> inList, int chunkSize) {
    List<List<DashboardActionItemInfo>> outList = [];
    List<DashboardActionItemInfo> tmpList = [];
    int counter = 0;

    for (int current = 0; current < inList.length; current++) {
      if (counter != chunkSize) {
        tmpList.add(inList[current]);
        counter++;
      }
      if (counter == chunkSize || current == inList.length - 1) {
        outList.add(tmpList.toList());
        tmpList.clear();
        counter = 0;
      }
    }
    return outList;
  }

  Widget setCheckInListView(List<List<DashboardActionItemInfo>> list) =>
      PageView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Image.network(
                list[index].first.);
          });

// void getDropDownDataResponse() async {
//   DropDownValuesResponse? response = await RemoteService().getDropDownData();
//   hideProgress();
//   if (response != null) {
//     print("Status:${response.statusCode}");
//     print(response.toJson().toString());
//     if (response.statusCode == 200) {
//       dropDownValuesResponse = response;
//       // for (var i = 0;
//       //     i < (dropDownValuesResponse?.extensions!.length)!;
//       //     i++) {
//       //   if (dropDownValuesResponse?.extensions![i].extension! == "+91") {}
//       // }
//     } else {
//       Utils.handleUnauthorized(context, response.error);
//     }
//   }
// }
}
