import 'package:alert_app/models/allowcation.dart';

import '../constants/asset.dart';

class HardDataService {
  List<Allowcation> getAllowcation() {
    return [
      Allowcation(
        title: "Extreme precipitation",
        icon: AppAsset.a,
      ),
      Allowcation(
        title: "Hurricanes",
        icon: AppAsset.b,
      ),
      Allowcation(
        title: "Thunderstorms and lightning",
        icon: AppAsset.c,
      ),
      Allowcation(
        title: "Storms",
        icon: AppAsset.d,
      ),
      Allowcation(
        title: "River breaking",
        icon: AppAsset.e,
      ),
      Allowcation(
        title: "Flood",
        icon: AppAsset.f,
      ),
      Allowcation(
        title: "Tornadoes",
        icon: AppAsset.g,
      ),
      Allowcation(
        title: "Humidity",
        icon: AppAsset.h,
      ),
      Allowcation(
        title: "Hailstorm",
        icon: AppAsset.i,
      ),
      Allowcation(
        title: "Heavy snow",
        icon: AppAsset.j,
      ),
    ];
  }
}
