// ignore_for_file: depend_on_referenced_packages

import 'dart:collection';

import 'package:alert_app/models/wildfire_response_model.dart';
import 'package:alert_app/services/wildfire_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

class MapController extends GetxController {
  var wildFireList = <WildFire>[].obs;
  var wildFireLoading = true.obs;
  var markerList = <Marker>[].obs;
  var defLan = 0.0.obs;
  var defLati = 0.0.obs;
  var polygone = HashSet<Polygon>().obs;
  var latilongPoit = <LatLng>[].obs;
  var polyline = <Polyline>{}.obs;

  CameraPosition kGooglePlex = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(39.70995, -108.83211),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void fetchWildfires() async {
    wildFireLoading(true);
    WildFireResponseModel wildFireResponseModel =
        await WildFireService().fetchWildFire();
    try {
      if (wildFireResponseModel.events!.isNotEmpty) {
        wildFireList.value = wildFireResponseModel.events!;
        // print("call");
        for (var i = 0; i < wildFireList.length; i++) {
          if (wildFireList[i].categories![0].id == 8) {
            // print(wildFireList[i].link);
            // print(wildFireList[i].geometries![0].coordinates![0]);
            // print(wildFireList[i].geometries![0].coordinates![1]);
            defLan.value = wildFireList[i].geometries![0].coordinates![1];
            defLati.value = wildFireList[i].geometries![0].coordinates![0];

            kGooglePlex = CameraPosition(
              target: LatLng(defLan.value, defLati.value),
              zoom: 14.4746,
            );

            final Uint8List markerIcon =
                await getBytesFromAsset('assets/icons/fire.png', 100);
            var markar = Marker(
              icon: BitmapDescriptor.fromBytes(markerIcon),
              markerId: MarkerId(wildFireList[i].id.toString()),
              position: LatLng(wildFireList[i].geometries![0].coordinates![1],
                  wildFireList[i].geometries![0].coordinates![0]),
              infoWindow: InfoWindow(
                  title: wildFireList[i].title,
                  snippet: wildFireList[i].categories![0].title.toString()),
            );

            latilongPoit.add(
              LatLng(wildFireList[i].geometries![0].coordinates![1],
                  wildFireList[i].geometries![0].coordinates![0]),
            );
            markerList.add(markar);
          }

          //    else {
          //     // print(wildFireList[i].link);
          //     // print(wildFireList[i].geometries![0].coordinates![0]);
          //     // print(wildFireList[i].geometries![0].coordinates![1]);
          //     // defLan.value = wildFireList[i].geometries![0].coordinates![1];
          //     // defLati.value = wildFireList[i].geometries![0].coordinates![0];

          //     kGooglePlex = CameraPosition(
          //       target: LatLng(defLan.value, defLati.value),
          //       zoom: 14.4746,
          //     );

          //     final Uint8List markerIcon =
          //         await getBytesFromAsset('assets/icons/shield.png', 100);
          //     var markar = Marker(
          //       icon: BitmapDescriptor.fromBytes(markerIcon),
          //       markerId: MarkerId(wildFireList[i].id.toString()),
          //       position: LatLng(wildFireList[i].geometries![0].coordinates![1],
          //           wildFireList[i].geometries![0].coordinates![0]),
          //       infoWindow: InfoWindow(
          //           title: wildFireList[i].title,
          //           snippet: wildFireList[i].categories![0].title.toString()),
          //     );

          //     latilongPoit.add(
          //       LatLng(wildFireList[i].geometries![0].coordinates![1],
          //           wildFireList[i].geometries![0].coordinates![0]),
          //     );
          //     markerList.add(markar);
          //   }
        }

        wildFireLoading(false);
      }
    } catch (e) {
      wildFireLoading(false);
    }
  }

  @override
  void onInit() {
    fetchWildfires();
    polygone.value.add(
      Polygon(
          polygonId: PolygonId("1"),
          points: latilongPoit,
          strokeColor: Colors.purple,
          strokeWidth: 1,
          geodesic: true,
          fillColor: Colors.purple),
    );

    super.onInit();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
