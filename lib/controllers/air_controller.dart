import 'package:airquality1/models/air_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'package:airquality1/models/location_model.dart';

class AirController {
  Location location;
  final String url = "https://api.waqi.info/";

  AirController(this.location);

  Future<Air> getData(context) async {
    final apiJson = await DefaultAssetBundle.of(context)
        .loadString("assets/api/apikey.json");
    final apiData = json.decode(apiJson);
    return getDataFromApi(apiData);
  }

  Future<Air> getDataFromApi(apiData) async {
    if (location.latitude != null && location.longitude != null) {
      final response = await get(
          '${url}feed/geo:${location.latitude};${location.longitude}/?token=${apiData['apikey']}');
      final data = json.decode(response.body);
      print("geo data: $data");
      return Air.fromJson(data);
    } else if (location.city != null) {
      final cityResponse = await get(
          '${url}search/?token=${apiData['apikey']}&keyword=${location.city}');
      final cityData = json.decode(cityResponse.body);
      final response = await get(
          '${url}feed/geo:${cityData['data'][0]['station']['geo'][0]};${cityData['data'][0]['station']['geo'][1]}/?token=${apiData['apikey']}');
      final data = json.decode(response.body);

      return Air.fromJson(data);
    }
  }
}
