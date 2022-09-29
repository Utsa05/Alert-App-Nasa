// ignore_for_file: depend_on_referenced_packages

import 'package:alert_app/alert_app.dart';
import 'package:alert_app/controllers/map_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  final MapController mapController = Get.put(MapController());

  runApp(const AlertApp());
}
