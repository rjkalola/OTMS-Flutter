import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Utils {
  // static String appUrl = "http://3.111.141.93/jvm/api/v1/";
  static String appUrl = "http://104.248.171.12:8000/";
  static String KEY_LOGIN_DATA = "KEY_LOGIN_DATA";

  static Future<String?> getLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(Utils.KEY_LOGIN_DATA);
  }

  static saveLoginData(String userdata) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(Utils.KEY_LOGIN_DATA, userdata);
  }

  static clearALlSharesPreferencesData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static handleUnauthorized(BuildContext context, String? message) {
    if (message != null) {
      showToastLong(context, message);
    }
  }

  static showToastShort(BuildContext context, String? message) {
    if (message != null) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  static showToastLong(BuildContext context, String? message) {
    if (message != null) {
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black87,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  static haxColor(String colorHexCode) {
    print("Color Code:"+colorHexCode);
    String colorNew = '0xff$colorHexCode';
    colorNew = colorNew.replaceAll("#", '');
    int colorInt = int.parse(colorNew);
    return colorInt;
  }


}
