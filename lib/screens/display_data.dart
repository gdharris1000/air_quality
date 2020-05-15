import 'package:flutter/material.dart';
import 'package:airquality1/models/air_model.dart';
import 'package:airquality1/controllers/location_controller.dart';
import 'package:airquality1/controllers/air_controller.dart';
import 'package:airquality1/models/location_model.dart';
import 'package:airquality1/widgets/aqi_widget.dart';

class DataView extends StatefulWidget {
  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
  int aqi = 0;
  String station = "Finding nearest station...";
  LocationController locationController = LocationController();

  @override
  void initState() {
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
      aqi = air.aqi;
      station = air.station;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text(
                'Air Quality Index Value',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: AQI(aqi),
            ),
            Container(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('Nearest station:\n $station'),
            ),
          ],
        ),
      ),
    );
  }
}
