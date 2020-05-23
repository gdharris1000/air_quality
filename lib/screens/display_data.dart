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
  int pm25 = 0;
  int pm10 = 0;
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
      pm25 = air.pm25;
      pm10 = air.pm10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/sky.jpg"), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxWidth: 300),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                padding: EdgeInsets.all(20.0),
                child: Text('Nearest station:\n $station'),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: AQI(aqi),
                ),
              ),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  getLocationData();
                },
                child: Text(
                  "Refresh",
                  style: TextStyle(color: Colors.white),
                ),
              ),
//              Container(
//                padding: EdgeInsets.all(20.0),
//                decoration: BoxDecoration(
//                  color: Colors.white.withOpacity(0.5),
//                  borderRadius: BorderRadius.circular(20.0),
//                ),
//                child: Text('PM25: $pm25'),
//              ),
//              Container(
//                padding: EdgeInsets.all(20.0),
//                decoration: BoxDecoration(
//                  color: Colors.white.withOpacity(0.5),
//                  borderRadius: BorderRadius.circular(20.0),
//                ),
//                child: Text('PM10: $pm10'),
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
