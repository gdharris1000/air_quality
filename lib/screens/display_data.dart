import 'package:airquality1/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:airquality1/models/air_model.dart';
import 'package:airquality1/controllers/location_controller.dart';
import 'package:airquality1/controllers/air_controller.dart';
import 'package:airquality1/models/location_model.dart';
import 'package:airquality1/widgets/aqi_widget.dart';

class DataView extends StatefulWidget {
  final Air air;

  DataView(this.air);

  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> {
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
                child: Text('Nearest station:\n ${widget.air.station}'),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: AQI(widget.air.aqi),
                ),
              ),
              Text(
                  "PM2.5: ${widget.air.pm25 != null ? widget.air.pm25 : 'no data available'}"),
              Text(
                  "PM10: ${widget.air.pm10 != null ? widget.air.pm10 : 'no data available'}"),
              Text(
                  "O3: ${widget.air.o3 != null ? widget.air.o3 : 'no data available'}"),
              RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  LoadingScreen(dataFromGeo: true);
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
