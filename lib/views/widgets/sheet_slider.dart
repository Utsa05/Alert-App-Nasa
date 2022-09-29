// ignore_for_file: depend_on_referenced_packages

import 'package:alert_app/others/core/constants/string_const.dart';
import 'package:alert_app/others/core/themes/app_colors.dart';
import 'package:alert_app/others/core/themes/text_styles.dart';
import 'package:alert_app/others/core/utils/utils.dart';
import 'package:alert_app/others/features/home/bloc/home_bloc.dart';
import 'package:alert_app/others/features/home/widgets/dialy_weather_widget.dart';
import 'package:alert_app/others/features/home/widgets/hourly_weather_widget.dart';
import 'package:alert_app/others/features/home/widgets/weather_detail_widget.dart';
import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/constants/image_cons.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import 'package:alert_app/views/pages/location_gps/location_widget.dart';
import 'package:alert_app/views/pages/map/wild_fire_map.dart';
import 'package:alert_app/views/widgets/item_widget.dart';
import 'package:alert_app/views/widgets/searching_widget.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';

import 'weather_detail_widget.dart';

class BottomSheetSilder extends StatefulWidget {
  const BottomSheetSilder({Key? key}) : super(key: key);

  @override
  State<BottomSheetSilder> createState() => _BottomSheetSilderState();
}

class _BottomSheetSilderState extends State<BottomSheetSilder> {
  final double _initFabHeight = 100.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  final PanelController _controller = PanelController();

  void togglePanel() =>
      _controller.isPanelOpen ? _controller.close() : _controller.open();
  //Okey now we've done with our http request let's now implement the data to our UI

  @override
  void initState() {
    super.initState();
    _fabHeight = _initFabHeight;
  }

  String currentImage = 'assets/images/the_sun.jpg';
  String currentModeImage = 'assets/image/morning.png';
  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    var w = MediaQuery.of(context).size.width;

    return SlidingUpPanel(
      maxHeight: _panelHeightOpen,
      minHeight: _panelHeightClosed,
      parallaxEnabled: true,
      parallaxOffset: .5,
      // body: _body(),
      panelBuilder: (sc) => _panel(sc),
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      onPanelSlide: (double pos) => setState(() {
        _fabHeight =
            pos * (_panelHeightOpen - _panelHeightClosed) + _initFabHeight;
      }),
    );
  }

  Widget _panel(ScrollController sc) {
    final _size = MediaQuery.of(context).size;
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(controller: sc, children: <Widget>[
          BlocProvider(
            create: (context) => HomeBloc()..getLocation(),
            child: BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeFailed) {
                  print("error");
                  showSnackBar(context, state.error);
                }
              },
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Loading();
                }
                if (state is HomeSuccess) {
                  final weather = state.weatherData;
                  print(weather.current.weather.first.icon);

                  if (weather.current.weather.first.icon == '50d') {
                    currentImage = 'assets/images/sun_mode.gif';
                  } else if (weather.current.weather.first.icon == '01d') {
                    currentImage = 'assets/images/sun_mode.gif';
                  } else if (weather.current.weather.first.icon == '02d') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  } else if (weather.current.weather.first.icon == '03d') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  } else if (weather.current.weather.first.icon == '04d') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  } else if (weather.current.weather.first.icon == '09d') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  } else if (weather.current.weather.first.icon == '10d') {
                    currentImage = 'assets/images/sun_mode.gif';
                  } else if (weather.current.weather.first.icon == '11d') {
                    currentImage = 'assets/images/sun_mode.gif';
                  } else if (weather.current.weather.first.icon == '13d') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  }
                  //for night
                  else if (weather.current.weather.first.icon == '03n') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  } else if (weather.current.weather.first.icon == '04n') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  } else if (weather.current.weather.first.icon == '09n') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  } else if (weather.current.weather.first.icon == '03d') {
                    currentImage = 'assets/images/cold_mode.jpg';
                  } else {
                    currentImage = 'assets/images/night_mode.gif';
                  }

                  return SlidingUpPanel(
                    controller: _controller,
                    boxShadow: const [],
                    parallaxEnabled: true,
                    maxHeight: _size.height * 0.7,
                    minHeight: _size.height * 0.22,
                    color: Colors.transparent,
                    // borderRadius: const BorderRadius.only(
                    //     topLeft: Radius.circular(25.0),
                    //     topRight: Radius.circular(25.0)),

                    panelBuilder: (control) {
                      return ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0)),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(25.0),
                                  topRight: Radius.circular(25.0)),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Weather Today",
                                        style: subTitleTextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    spacer(height: 12),
                                    HourlyWeatherWidget(
                                        hourWeather: weather.hourly),
                                    DailyWeatherWidget(
                                        dailyWeather: weather.daily)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is HomeFailed) {
                  return SomethingWentWrong(message: state.error);
                }
                if (state is HomeLocationNotEnabled) {
                  if (state.error == locationDisabledError) {
                    return Center(
                      child: Text(
                        'Location services are disabled.\nPlease Restart app after enabling it.',
                        style: subTitleTextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    );
                  }
                  return SomethingWentWrong(message: state.error);
                }
                return const SizedBox();
              },
            ),
          ),
        ]));
  }

  Widget ListItem(String Sol, int min, int max) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10.0),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                "Sol $Sol",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 120,
            ),
            Expanded(
              child: Text(
                "High: $max°C",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: <Widget>[
            const Expanded(
              child: Text(
                "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              width: 120,
            ),
            Expanded(
              child: Text(
                "Low: $min°C",
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          height: 2.0,
          width: double.infinity,
          color: Colors.white,
        )
      ],
    );
  }

  Widget _body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 35,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                width: 10,
              ),
              const Expanded(child: Searching()),
              const SizedBox(
                width: 30,
              ),
              SizedBox(
                height: 38,
                child: LiteRollingSwitch(
                  width: 90,
                  //initial value
                  value: true,
                  textOn: 'ON',
                  textOff: 'OFF',
                  colorOn: Colors.green,
                  colorOff: Colors.red,
                  iconOn: Icons.done,
                  iconOff: Icons.alarm_off_sharp,
                  textSize: 16.0,
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    print('Current State of SWITCH IS: $state');
                  },
                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                ),
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: MyLocation(),
        ),
        const SizedBox(
          height: 25,
        ),
        Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              height: 180,
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        AppAsset.turbine,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => HomeBloc()..getLocation(),
                    child: BlocConsumer<HomeBloc, HomeState>(
                      listener: (context, state) {
                        if (state is HomeFailed) {
                          print("error");
                          showSnackBar(context, state.error);
                        }
                      },
                      builder: (context, state) {
                        if (state is HomeSuccess) {
                          var weather = state.weatherData.current;

                          return WeatherDetailsWidget2(
                              curWeather: weather, cimage: currentImage);
                        }
                        if (state is HomeLoading) {
                          return const Loading();
                        }

                        if (state is HomeFailed) {
                          return SomethingWentWrong(message: state.error);
                        }
                        if (state is HomeLocationNotEnabled) {
                          if (state.error == locationDisabledError) {
                            return Center(
                              child: Text(
                                'Location services are disabled.\nPlease Restart app after enabling it.',
                                style: subTitleTextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            );
                          }
                          return SomethingWentWrong(message: state.error);
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => const WildFireMappPage())),
                  child: Item(
                    title: "Wild Fire",
                    path: 'assets/icons/fire.png',
                  ),
                ),
                Item(
                  title: "Assist Me",
                  path: AppAsset.assist_me,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Item(
                  title: "Daily Disaster",
                  path: AppAsset.disaster,
                ),
                Item(
                  title: "Self Escape",
                  path: AppAsset.self_escape,
                ),
              ],
            ),
            const SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Item(
                  title: "Echo Meter",
                  path: AppAsset.echo_meter,
                ),
                Item(
                  title: "Health Care",
                  path: AppAsset.health_focus,
                ),
              ],
            ),
          ],
        ),
        const Expanded(
            child: SizedBox(
          height: 10,
        ))
      ],
    );
  }
}
