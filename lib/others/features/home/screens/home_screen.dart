// ignore_for_file: avoid_print

import 'package:alert_app/views/constants/image_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../core/constants/string_const.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/text_styles.dart';
import '../../../core/utils/utils.dart';
import '../bloc/home_bloc.dart';
import '../widgets/dialy_weather_widget.dart';
import '../widgets/hourly_weather_widget.dart';
import '../widgets/weather_detail_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getCurrentMode() {
    var timeNow = DateTime.now().hour;
    print(timeNow);

    if (timeNow <= 17) {
      //5
      return 'night';
    } else {
      return 'day';
    }
  }

  String currentImage = 'assets/images/the_sun.jpg';
  String currentModeImage = 'assets/image/morning.png';
  @override
  void initState() {
    getCurrentMode();
    print("Home");
    super.initState();
  }

  final PanelController _controller = PanelController();

  void togglePanel() =>
      _controller.isPanelOpen ? _controller.close() : _controller.open();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider(
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
                body: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            currentImage,
                          ))),
                  child: Stack(
                    children: [
                      Positioned(
                        top: _size.width * 0.01,
                        right: _size.width * 0.005,
                        child: Image.asset(
                          ImageAssets.getAsset(
                              weather.current.weather.first.icon),
                          height: _size.height * 0.2,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: _size.width * 0.6,
                            padding: EdgeInsets.only(
                                left: _size.width * 0.08,
                                right: _size.width * 0.08,
                                bottom: 20.0,
                                top: _size.height * 0.07),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  state.place,
                                  style: GoogleFonts.montserrat(
                                    fontSize: 26.0,
                                    color: Colors.white,
                                  ),
                                ),
                                spacer(height: 8),
                                Text(
                                  '${weather.current.temp}°',
                                  style: titleTextStyle(fontSize: 64),
                                ),
                                spacer(),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                    color: AppColors.lightBackgroundColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Text(
                                    weather.current.weather.first.main,
                                    style: titleTextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          WeatherDetailsWidget(
                              curWeather: weather.current,
                              cimage: currentImage),
                        ],
                      ),
                    ],
                  ),
                ),
                panelBuilder: (control) {
                  return ClipPath(
                    clipper: ProsteBezierCurve(
                      position: ClipPosition.top,
                      list: [
                        BezierCurveSection(
                          start: Offset(_size.width, 0),
                          top: Offset(_size.width / 2, 14),
                          end: const Offset(0, 0),
                        ),
                      ],
                    ),
                    child: ClipRRect(
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
                                  const SizedBox(
                                    height: 14.0,
                                  ),
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
    );
  }
}
