import 'package:alert_app/controllers/weather_controller.dart';
import 'package:alert_app/views/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeatherInfo extends StatefulWidget {
  const WeatherInfo({super.key});

  @override
  State<WeatherInfo> createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  final WeatherController weatherController = Get.put(WeatherController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => weatherController.isWeatherLoading.value == false
            ? SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
