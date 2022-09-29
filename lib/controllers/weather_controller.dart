import 'package:alert_app/models/weather_response_model.dart';
import 'package:alert_app/services/utils.dart';
import 'package:alert_app/services/weather_service.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherController extends GetxController {
  var weatherResponse = WeatherResponseModel().obs;

  var isWeatherLoading = true.obs;
  @override
  void onInit() async {
    getLocation();

    super.onInit();
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getLocation() async {
    Position position = await _getGeoLocationPosition();
    print("location");
    isWeatherLoading(true);

    WeatherResponseModel response = await WeatherService()
        .fetchWeather(position.latitude, position.longitude);

    try {
      if (response.weather!.isNotEmpty) {
        weatherResponse.value = response;
        isWeatherLoading(false);
      } else {
        isWeatherLoading(false);
      }
    } catch (e) {
      isWeatherLoading(false);
    }

    //location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    //GetAddressFromLatLong(position);
  }
}
