class AirModel {
  int aqi;
//  double no2;
//  double o3;
//  double pm25;
//  double pm10;
//  String station;
//  double temp;
//  double humidity;

//  AirModel(this.aqi, this.no2, this.o3, this.pm25, this.pm10, this.station,
//      this.temp, this.humidity);

  AirModel(this.aqi);

  AirModel.fromJson(Map<String, dynamic> parsedJson) {
    //convert to int
    aqi = parsedJson['data']['aqi'];
    //convert to double
    //no2 = parsedJson['iaqi']['no2']['v'];
    //convert to double
    //o3 = parsedJson['o3'];
  }
}
