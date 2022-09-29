// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:alert_app/controllers/map_controller.dart';
import 'package:alert_app/views/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MapPageCheck extends StatefulWidget {
  const MapPageCheck({super.key});

  @override
  State<MapPageCheck> createState() => _MapPageCheckState();
}

class _MapPageCheckState extends State<MapPageCheck> {
  final Completer<GoogleMapController> _controller = Completer();
  final MapController mapController = Get.put(MapController());

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(39.70995, -108.83211),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Obx(() => mapController.wildFireLoading.value == false
          ? Stack(
              children: [
                GoogleMap(
                  //  polygons: mapController.polygone.value,
                  //polylines: mapController.polyline,
                  //mapType: MapType.satellite,
                  initialCameraPosition: mapController.kGooglePlex,
                  markers: Set<Marker>.of(mapController.markerList),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 46.0,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(40.0)),
                        alignment: Alignment.center,
                        child: const Text(
                          "WildFire Zone",
                          style: TextStyle(
                              color: AppColor.whiteColor, fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        onPressed: _goToTheLake,
        label: const Icon(Icons.location_on_sharp),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
