import 'package:flutter/foundation.dart';

class Air extends ChangeNotifier {
  int aqi;
  int pm25;
  double o3;
//  double pm25;
  int pm10;
  String station;
//  double temp;
//  double humidity;

//  AirModel(this.aqi, this.no2, this.o3, this.pm25, this.pm10, this.station,
//      this.temp, this.humidity);

  Air(this.aqi, this.station);

  Air.fromJson(Map<String, dynamic> parsedJson) {
    aqi = parsedJson['data']['aqi'];

    station = parsedJson['data']['city']['name'];

    parsedJson['data']['iaqi']['pm25']['v'] != null
        ? pm25 = parsedJson['data']['iaqi']['pm25']['v']
        : pm25 = null;

    parsedJson['data']['iaqi']['pm10']['v'] != null
        ? pm10 = parsedJson['data']['iaqi']['pm10']['v']
        : pm10 = null;

    parsedJson['data']['iaqi']['o3']['v'] != null
        ? o3 = parsedJson['data']['iaqi']['o3']['v']
        : o3 = null;

    notifyListeners();
  }
}
