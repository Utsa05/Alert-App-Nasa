// ignore_for_file: depend_on_referenced_packages

import 'dart:async';
import 'package:alert_app/controllers/commone_controller.dart';
import 'package:alert_app/controllers/map_controller.dart';
import 'package:alert_app/views/constants/color.dart';
import 'package:alert_app/views/widgets/loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class WildFireMappPage extends StatefulWidget {
  const WildFireMappPage({super.key});

  @override
  State<WildFireMappPage> createState() => _WildFireMappPageState();
}

class _WildFireMappPageState extends State<WildFireMappPage> {
  final Completer<GoogleMapController> _controller = Completer();
  final MapController mapController = Get.put(MapController());
  final CommonController commonController = Get.put(CommonController());

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
                  mapType: MapType.satellite,
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
              child: LoaderWidget(),
            )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primaryColor.withOpacity(0.7),
        onPressed: _goToTheLake,
        label: const Icon(
          Icons.location_on_sharp,
          color: AppColor.whiteColor,
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(
            commonController.latitude.value, commonController.longitude.value),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414)));
  }
}
