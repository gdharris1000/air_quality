import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'package:airquality1/models/air_model.dart';
import 'dart:convert';

class DataView extends StatefulWidget {
  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  String aqi = "hi";

  @override
  void initState() {
    // TODO: implement initState
    getApi(context);

    super.initState();
  }

  void getApi(context) async {
    final apiJson = await DefaultAssetBundle.of(context)
        .loadString("assets/api/apikey.json");
    final apiData = json.decode(apiJson);
    getData(apiData);
  }

  void getData(apiData) async {
    final response = await get(
        'https://api.waqi.info/feed/geo:52.060820;-0.733064/?token=${apiData['apikey']}');
    final data = json.decode(response.body);
    print(data);
    final airModel = AirModel.fromJson(json.decode(response.body));

    setState(() {
      aqi = airModel.aqi.toString();
      print('aqi: $aqi');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(aqi),
      ),
    );
  }
}
