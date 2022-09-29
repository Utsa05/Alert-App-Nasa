// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:convert';

import 'package:alert_app/models/wildfire_response_model.dart';
import 'package:alert_app/views/constants/api_cons.dart';
import 'package:http/http.dart' as http;

class WildFireService {
  Future<WildFireResponseModel> fetchWildFire() async {
    var client = http.Client();

    print("I'm from Wild fire service ):");
    //header
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    var response =
        await client.get(Uri.parse(ApiCons.eonetApiURL), headers: headers);

    if (response.statusCode == 200) {
      WildFireResponseModel pModel =
          WildFireResponseModel.fromJson(jsonDecode(response.body));
      // print(pModel.data.productList[0].productName);

      return pModel;
    } else {
      print("error");
    }
    throw Exception('wild fire not found');
  }
}
