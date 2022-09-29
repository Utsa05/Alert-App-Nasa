// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/image_const.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/themes/text_styles.dart';
import '../../../core/utils/utils.dart';
import '../../home/widgets/weather_detail_widget.dart';
import '../bloc/city_weather_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  String currentBgimage = 'assets/images/sun_mode.gif';

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CityWeatherBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          // appBar: AppBar(
          //   elevation: 0,
          //   automaticallyImplyLeading: false,
          //   // centerTitle: true,
          //   backgroundColor: Colors.transparent,
          //   title: Container(
          //     margin: const EdgeInsets.only(top: 8.0),
          //     decoration: const BoxDecoration(color: Colors.white),
          //     width: _size.width,
          //     child: TextField(
          //       controller: _searchController,
          //       style: titleTextStyle(fontSize: 18),
          //       onSubmitted: (value) {
          //         BlocProvider.of<CityWeatherBloc>(context)
          //             .add(SearchCityWeather(value));
          //       },
          //       decoration: InputDecoration(
          //         hintText: 'Search City',
          //         hintStyle: subTitleTextStyle(fontSize: 18),
          //         border: InputBorder.none,
          //         prefixIcon: Icon(
          //           Icons.search_rounded,
          //           size: 28,
          //           color: AppColors.iconColor,
          //         ),
          //       ),
          //     ),
          //   ),
          //   actions: [
          // IconButton(
          //     key: const ValueKey('refresh'),
          //     onPressed: () {
          //       BlocProvider.of<CityWeatherBloc>(context)
          //           .add(SearchCityWeather(_searchController.text));
          //     },
          //     icon: Icon(
          //       Icons.refresh,
          //       size: 28,
          //       color: AppColors.iconColor,
          //     ))
          //   ],
          // ),
          body: BlocListener<CityWeatherBloc, CityWeatherState>(
            listener: (context, state) {
              if (state is CityWeatherFailed) {
                showSnackBar(context, state.error);
              }
            },
            child: BlocBuilder<CityWeatherBloc, CityWeatherState>(
              builder: (context, state) {
                if (state is CityWeatherInitial ||
                    _searchController.text.isEmpty) {
                  return Container(
                    height: _size.height,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 40.0,
                              left: 14.0,
                              right: 14.0,
                              bottom: 100.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            boxShadow: const [
                              BoxShadow(color: Colors.black, spreadRadius: 0.1)
                            ],
                            color: Colors.white,
                          ),
                          width: _size.width,
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _searchController,
                                  style: titleTextStyle(fontSize: 18),
                                  onSubmitted: (value) {
                                    BlocProvider.of<CityWeatherBloc>(context)
                                        .add(SearchCityWeather(value));
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Search City',
                                    hintStyle: subTitleTextStyle(fontSize: 18),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      size: 28,
                                      color: AppColors.iconColor,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                  key: const ValueKey('refresh'),
                                  onPressed: () {
                                    BlocProvider.of<CityWeatherBloc>(context)
                                        .add(SearchCityWeather(
                                            _searchController.text));
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    size: 28,
                                    color: AppColors.iconColor,
                                  ))
                            ],
                          ),
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/3d/02d.png',
                                height: _size.height * 0.25,
                              ),
                              spacer(),
                              Text(
                                'Search the weather \nof the city you want !',
                                textAlign: TextAlign.center,
                                style: titleTextStyle(
                                    fontSize: 28, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state is CityWeatherLoading) {
                  return const Loading();
                }

                if (state is CityWeatherSuccess) {
                  print(state.weather.weather.first.icon);
                  if (state.weather.weather.first.icon == '50d') {
                    currentBgimage = 'assets/images/sun_mode.gif';
                  } else if (state.weather.weather.first.icon == '01d') {
                    currentBgimage = 'assets/images/sun_mode.gif';
                  } else if (state.weather.weather.first.icon == '02d') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  } else if (state.weather.weather.first.icon == '03d') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  } else if (state.weather.weather.first.icon == '04d') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  } else if (state.weather.weather.first.icon == '09d') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  } else if (state.weather.weather.first.icon == '10d') {
                    currentBgimage = 'assets/images/sun_mode.gif';
                  } else if (state.weather.weather.first.icon == '11d') {
                    currentBgimage = 'assets/images/sun_mode.gif';
                  } else if (state.weather.weather.first.icon == '13d') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  }
                  //for night
                  else if (state.weather.weather.first.icon == '03n') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  } else if (state.weather.weather.first.icon == '04n') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  } else if (state.weather.weather.first.icon == '09n') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  } else if (state.weather.weather.first.icon == '03d') {
                    currentBgimage = 'assets/images/cold_mode.jpg';
                  } else {
                    currentBgimage = 'assets/images/night_mode.gif';
                  }
                  return Stack(
                    children: [
                      Image.asset(
                        currentBgimage,
                        fit: BoxFit.cover,
                        height: _size.height,
                        width: _size.width,
                      ),
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: SizedBox(
                          height: _size.height,
                          width: _size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 100.0,
                              ),
                              Image.asset(
                                ImageAssets.getAsset(
                                    state.weather.weather.first.icon),
                                height: _size.height * 0.18,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  color: AppColors.lightBackgroundColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Text(
                                  state.weather.weather.first.main,
                                  style: titleTextStyle(fontSize: 16),
                                ),
                              ),
                              spacer(height: 10),
                              Text(
                                "${state.weather.name}, ${state.weather.country}",
                                style: titleTextStyle(fontSize: 22),
                              ),
                              spacer(height: 10),
                              Text(
                                '${state.weather.temp}° C',
                                style: titleTextStyle(fontSize: 50),
                              ),
                              spacer(height: 8),
                              Text(
                                '${state.weather.tempMax}° C / ${state.weather.tempMin}° C',
                                style: subTitleTextStyle(fontSize: 18),
                              ),
                              Expanded(
                                child: GridView(
                                  shrinkWrap: true,
                                  primary: false,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 2.7,
                                          crossAxisCount: 2),
                                  children: [
                                    HeadingDetailWidget(
                                        cimage: 'assets/images/cold_mode.jpg',
                                        title: "Humidity",
                                        value: '${state.weather.humidity}%'),
                                    HeadingDetailWidget(
                                        cimage: 'assets/images/cold_mode.jpg',
                                        title: "Wind Speed",
                                        value: '${state.weather.wind} m/s'),
                                    HeadingDetailWidget(
                                        cimage: 'assets/images/cold_mode.jpg',
                                        title: "Pressure",
                                        value: '${state.weather.pressure} hPa'),
                                    HeadingDetailWidget(
                                        cimage: 'assets/images/cold_mode.jpg',
                                        title: "Visibility",
                                        value:
                                            '${state.weather.visibility / 1000} km'),
                                    HeadingDetailWidget(
                                        cimage: 'assets/images/cold_mode.jpg',
                                        title: "Cloudiness",
                                        value: '${state.weather.clouds}%'),
                                    HeadingDetailWidget(
                                        cimage: 'assets/images/cold_mode.jpg',
                                        title: "Feels Like",
                                        value: '${state.weather.feelsLike}'),
                                    HeadingDetailWidget(
                                        cimage: 'assets/images/cold_mode.jpg',
                                        title: "Sunrise",
                                        value: getTimeInHHMM(
                                            state.weather.sunrise)),
                                    HeadingDetailWidget(
                                        cimage: 'assets/images/cold_mode.jpg',
                                        title: "Sunset",
                                        value: getTimeInHHMM(
                                            state.weather.sunset)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 40.0, left: 14.0, right: 14.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                        ),
                        width: _size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                style: titleTextStyle(fontSize: 18),
                                onSubmitted: (value) {
                                  BlocProvider.of<CityWeatherBloc>(context)
                                      .add(SearchCityWeather(value));
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search City',
                                  hintStyle: subTitleTextStyle(fontSize: 18),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    size: 28,
                                    color: AppColors.iconColor,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                key: const ValueKey('refresh'),
                                onPressed: () {
                                  BlocProvider.of<CityWeatherBloc>(context).add(
                                      SearchCityWeather(
                                          _searchController.text));
                                },
                                icon: Icon(
                                  Icons.refresh,
                                  size: 28,
                                  color: AppColors.iconColor,
                                ))
                          ],
                        ),
                      ),
                    ],
                  );
                }
                if (state is CityWeatherFailed) {
                  return Stack(
                    children: [
                      const SomethingWentWrong(),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 40.0, left: 14.0, right: 14.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.white,
                        ),
                        width: _size.width,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                style: titleTextStyle(fontSize: 18),
                                onSubmitted: (value) {
                                  BlocProvider.of<CityWeatherBloc>(context)
                                      .add(SearchCityWeather(value));
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search City',
                                  hintStyle: subTitleTextStyle(fontSize: 18),
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    size: 28,
                                    color: AppColors.iconColor,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                key: const ValueKey('refresh'),
                                onPressed: () {
                                  BlocProvider.of<CityWeatherBloc>(context).add(
                                      SearchCityWeather(
                                          _searchController.text));
                                },
                                icon: Icon(
                                  Icons.refresh,
                                  size: 28,
                                  color: AppColors.iconColor,
                                ))
                          ],
                        ),
                      ),
                    ],
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        );
      }),
    );
  }
}
