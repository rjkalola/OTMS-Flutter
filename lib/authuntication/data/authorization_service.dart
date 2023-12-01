import 'dart:convert';

import 'package:http/http.dart';
import 'package:otms/model/DropDownValuesResponse.dart';
import '../../model/LoginResponse.dart';
import '../../utils/Utils.dart';

class RemoteService {
  Future<LoginResponse?> login(String phoneNumber, String phoneExtension) async {
    final body = {'phone_no': phoneNumber, 'phone_no_extension': phoneExtension};
    print("body:${body}");
    Response response = await post(Uri.parse("${Utils.appUrl}/auth/login"),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));

    var data = response.body;
    print("response data:${data.toString()}");
    var responseData = loginResponseFromJson(data);
    responseData.statusCode = response.statusCode;
    return responseData;

   /* if (response.statusCode == 200) {
      var data = response.body;
      // String jsonsDataString = data.toString(); // Error: toString of Response is assigned to jsonDataString.
      // var _data = jsonDecode(jsonsDataString);
      // print("Data:$_data");
      return loginResponseFromJson(data);
    }*/
  }

  Future<LoginResponse?> signUp(String firstName,String lastName,String phoneNumber,String phoneExtension) async {
    final body = {'first_name': firstName,'last_name': lastName,'phone_no': phoneNumber
      ,'phone_no_extension': phoneExtension,'birth_date': "2000-05-25"};
    print("body:${body}");
    Response response = await post(Uri.parse("${Utils.appUrl}/users/"),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));
    var data = response.body;
    print("response data:${data.toString()}");
    var responseData = loginResponseFromJson(data);
    responseData.statusCode = response.statusCode;
    return responseData;
  }

  Future<DropDownValuesResponse?> getDropDownData() async {
    Response response = await get(Uri.parse("${Utils.appUrl}/dropdown-values"),
        headers: <String, String>{"Content-Type": "application/json"});
    var data = response.body;
    var responseData = dropDownValuesResponseFromJson(data);
    responseData.statusCode = response.statusCode;
    return responseData;
  }

  Future<LoginResponse?> verifyOTP(String phoneNumber, String phoneExtension,String otp) async {
    final body = {'phone_no': phoneNumber, 'phone_no_extension': phoneExtension, 'otp': otp};
    print("body:${body}");
    Response response = await post(Uri.parse("${Utils.appUrl}/auth/login"),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));
    var data = response.body;
    print("response data:${data.toString()}");
    var responseData = loginResponseFromJson(data);
    responseData.statusCode = response.statusCode;
    return responseData;
  }
}
