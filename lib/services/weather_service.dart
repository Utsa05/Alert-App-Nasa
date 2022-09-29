// ignore_for_file: avoid_print, depend_on_referenced_packages

import 'dart:convert';

import 'package:alert_app/models/weather_response_model.dart';
import 'package:alert_app/models/wildfire_response_model.dart';
import 'package:alert_app/views/constants/api_cons.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  Future<WeatherResponseModel> fetchWeather(double lat, double longi) async {
    var client = http.Client();

    print("I'm from Weather Servixw ):");
    //header
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    var response = await client.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?lat=37.4219983&lon=37.4219983&appid=6dae5d4487baefc23abba2df96d47ae2"),
        headers: headers);
    print(response.body);
    if (response.statusCode == 200) {
      WeatherResponseModel pModel =
          WeatherResponseModel.fromJson(jsonDecode(response.body));
      // print(pModel.data.productList[0].productName);

      return pModel;
    } else {
      print("error");
    }
    throw Exception('wild fire not found');
  }
}
