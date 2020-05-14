import 'package:airquality1/models/air_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' show get;
import 'package:airquality1/models/location_model.dart';

class AirController {
  Location location;
  String url = "https://api.waqi.info/feed/";

  AirController(this.location);

  Future<Air> getData(context) async {
    final apiJson = await DefaultAssetBundle.of(context)
        .loadString("assets/api/apikey.json");
    final apiData = json.decode(apiJson);
    return getDataFromApi(apiData);
  }

  Future<Air> getDataFromApi(apiData) async {
//    AirModel airModel;

    if (location.latitude != null && location.longitude != null) {
      final response = await get(
          '${url}geo:${location.latitude};${location.longitude}/?token=${apiData['apikey']}');
      final data = json.decode(response.body);
      print(data);
      return Air.fromJson(json.decode(response.body));
    } else if (location.city != null) {
      final response =
          await get('${url}feed/${location.city}/?token=${apiData['apikey']}');
      final data = json.decode(response.body);
      print(data);
      return Air.fromJson(json.decode(response.body));
    }
  }
}
