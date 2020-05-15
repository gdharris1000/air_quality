class Air {
  int aqi;
//  double no2;
//  double o3;
//  double pm25;
//  double pm10;
  String station;
//  double temp;
//  double humidity;

//  AirModel(this.aqi, this.no2, this.o3, this.pm25, this.pm10, this.station,
//      this.temp, this.humidity);

  Air(this.aqi, this.station);

  Air.fromJson(Map<String, dynamic> parsedJson) {
    aqi = parsedJson['data']['aqi'];
    station = parsedJson['data']['city']['name'];
    //no2 = parsedJson['iaqi']['no2']['v'];
  }
}
