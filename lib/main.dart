// ignore_for_file: depend_on_referenced_packages

import 'package:alert_app/alert_app.dart';
import 'package:alert_app/controllers/map_controller.dart';
import 'package:alert_app/others/core/utils/app_state_notifier.dart';
import 'package:alert_app/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // TwilioFlutter twilioFlutter = TwilioFlutter(
  //     accountSid: 'ACf6f4bb6436ce88ebe6fcf6ff086742ef',
  //     authToken: '7e76ae3d4b42b473e85c92494e0e70c7',
  //     twilioNumber: '+17246184138');

  // twilioFlutter.sendSMS(
  //     toNumber: '+8801971161450', messageBody: 'Notification form Nasa Alert');
  //final MapController mapController = Get.put(MapController());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    const AlertApp(),
  );
}
