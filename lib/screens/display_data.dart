import 'package:flutter/material.dart';
import 'package:airquality1/models/air_model.dart';
import 'package:airquality1/controllers/location_controller.dart';
import 'package:airquality1/controllers/air_controller.dart';
import 'package:airquality1/models/location_model.dart';

class DataView extends StatefulWidget {
  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  String aqi = "hi";
  LocationController locationController = LocationController();

  @override
  void initState() {
    // TODO: implement initState
    getLocationData();
    super.initState();
  }

  void getLocationData() async {
    Location location = await locationController.getCurrentLocation();
    getAirData(location);
  }

  void getAirData(location) async {
    AirController airController = AirController(location);
    Air air = await airController.getData(context);
    setState(() {
      aqi = air.aqi.toString();
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
