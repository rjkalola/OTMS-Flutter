import 'dart:convert';

import 'package:http/http.dart';
import 'package:otms/model/DropDownValuesResponse.dart';
import '../model/login_response.dart';
import '../utils/utils.dart';

class RemoteService {
  Future<LoginResponse?> login(String email, String password) async {
    // Response response = await post(Uri.parse("${Utils.appUrl}kk-login"),
    //     body: {'email': email, 'password': password});
    final body = {'phone_no': email, 'phone_no_extension': password};
    Response response = await post(Uri.parse("${Utils.appUrl}auth/login"),
        headers: {"Content-Type": "application/json"}, body: json.encode(body));
    print(response.statusCode.toString());
    print(response.body);
    if (response.statusCode == 200) {
      var data = response.body;
      // String jsonsDataString = data.toString(); // Error: toString of Response is assigned to jsonDataString.
      // var _data = jsonDecode(jsonsDataString);
      // print("Data:$_data");
      return loginResponseFromJson(data, true);
    }
  }

  Future<DropDownValuesResponse?> getDropDownData() async {
    Response response = await get(Uri.parse("${Utils.appUrl}dropdown-values"),
        headers: <String, String>{"Content-Type": "application/json"});
    var data = response.body;
    if (data != null) {
      var responseData = dropDownValuesResponseFromJson(data);
      responseData.statusCode = response.statusCode;
      return dropDownValuesResponseFromJson(data);
    }
  }
}
