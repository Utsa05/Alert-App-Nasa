import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/current_model.dart';

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    Key? key,
    required this.curWeather,
    required this.cimage,
  }) : super(key: key);

  final Current curWeather;
  final String cimage;

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2.5, crossAxisCount: 2),
      children: [
        HeadingDetailWidget(
          title: "Humidity",
          value: '${curWeather.humidity}%',
          cimage: cimage,
        ),
        HeadingDetailWidget(
            title: "Wind Speed",
            value: '${curWeather.windSpeed} m/s',
            cimage: cimage),
        HeadingDetailWidget(
          title: "Pressure",
          value: '${curWeather.pressure} hPa',
          cimage: cimage,
        ),
        HeadingDetailWidget(
          title: "UV",
          value: '${curWeather.uvi}',
          cimage: cimage,
        ),
        HeadingDetailWidget(
          title: "Visibility",
          value: '${curWeather.visibility} km',
          cimage: cimage,
        ),
        HeadingDetailWidget(
            title: "Cloudiness",
            value: '${curWeather.clouds}%',
            cimage: cimage),
      ],
    );
  }
}

class HeadingDetailWidget extends StatelessWidget {
  final String title;
  final String value;
  final String? cimage;

  const HeadingDetailWidget(
      {Key? key, required this.title, required this.value, this.cimage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white,
            )),
        Text(
          value,
          style: GoogleFonts.montserrat(
            fontSize: 22,
            color: cimage == 'assets/images/cold_mode.jpg'
                ? Colors.pink
                : Colors.black,
          ),
        ),
      ],
    );
  }
}
