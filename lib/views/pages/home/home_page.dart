import 'package:alert_app/models/current_model.dart';
import 'package:alert_app/others/core/constants/string_const.dart';
import 'package:alert_app/others/core/themes/text_styles.dart';
import 'package:alert_app/others/core/utils/utils.dart';
import 'package:alert_app/others/features/city/screens/search_screen.dart';
import 'package:alert_app/others/features/home/bloc/home_bloc.dart';
import 'package:alert_app/views/constants/asset.dart';
import 'package:alert_app/views/pages/daily_disaster/daily_disaster.dart';
import 'package:alert_app/views/pages/location_gps/location_widget.dart';
import 'package:alert_app/views/pages/map/wild_fire_map.dart';
import 'package:alert_app/views/pages/self_escape/self_escape.dart';
import 'package:alert_app/views/widgets/item_widget.dart';
import 'package:alert_app/views/widgets/sheet_slider.dart';
import 'package:alert_app/views/widgets/text_widget.dart';
import 'package:alert_app/views/widgets/weather_detail_widget.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PanelController _controller = PanelController();
  @override
  void initState() {
    HomeBloc().getLocation();
    super.initState();
  }

  void togglePanel() =>
      _controller.isPanelOpen ? _controller.close() : _controller.open();
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    //set backgroud image
    var boxDecoration = const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AppAsset.home_bg), fit: BoxFit.cover));
    return Scaffold(
      body: HomeBody(boxDecoration: boxDecoration),
    );
  }
}

//splash body
class HomeBody extends StatelessWidget {
  const HomeBody({
    Key? key,
    required this.boxDecoration,
  }) : super(key: key);

  final BoxDecoration boxDecoration;

  @override
  Widget build(BuildContext context) {
    String currentImage = 'assets/images/the_sun.jpg';

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: boxDecoration,
      child: Stack(
        children: [
          Column(
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
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
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
                  SizedBox(
                    height: 400.0,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            const WildFireMappPage())),
                                child: Item(
                                  title: "WildFire",
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
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            const DailyDisasterPage())),
                                child: Item(
                                  title: "Daily Disaster",
                                  path: AppAsset.disaster,
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            const SelfEscapePage())),
                                child: Item(
                                  title: "Self Escape",
                                  path: AppAsset.self_escape,
                                ),
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
                    ),
                  )
                ],
              ),
              const Expanded(
                  child: SizedBox(
                height: 10,
              ))
            ],
          ),
          const BottomSheetSilder(),
        ],
      ),
    );
  }
}

class Searching extends StatelessWidget {
  const Searching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (() => Navigator.push(context,
          MaterialPageRoute(builder: (builder) => const SearchScreen()))),
      child: Container(
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.all(2),
        height: 40,
        width: w * 0.6,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
            const SizedBox(
              width: 3,
            ),
            Expanded(
                child: TextLtdWidget(
              title: "searching now",
              color: Colors.white.withOpacity(0.7),
            ))
          ],
        ),
      ),
    );
  }
}
