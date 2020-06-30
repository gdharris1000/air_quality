import 'package:airquality1/screens/loading_screen.dart';
import 'package:airquality1/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:airquality1/models/air_model.dart';
import 'package:airquality1/widgets/aqi_widget.dart';
import 'package:airquality1/mixins/aqi_level_mixin.dart';

class DataView extends StatefulWidget {
  final Air air;

  DataView(this.air);

  @override
  _DataViewState createState() => _DataViewState();
}

class _DataViewState extends State<DataView> with AqiLevelMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: colourLevel(widget.air.aqi),
            child: SafeArea(
              child: Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text('Air Quality Index'),
                      ),
                      Center(
                        child: Text(
                          widget.air.aqi.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 60.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          textLevel(widget.air.aqi),
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text('Nearest station:'),
                Text(widget.air.station),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('PM2.5'),
                      Text(
                          "${widget.air.pm25 != null ? widget.air.pm25 : 'no data available'}")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('PM10'),
                      Text(
                          "${widget.air.pm10 != null ? widget.air.pm10 : 'no data available'}")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('O3'),
                      Text(
                          "${widget.air.o3 != null ? widget.air.o3 : 'no data available'}")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              children: <Widget>[
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoadingScreen(dataFromGeo: true)));
                  },
                  child: Text(
                    "Refresh using my location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                  child: Text(
                    "Search for a new location",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
//      body: Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//              image: AssetImage("assets/images/sky.jpg"), fit: BoxFit.cover),
//        ),
//        child: SafeArea(
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Container(
//                constraints: BoxConstraints(maxWidth: 300),
//                decoration: BoxDecoration(
//                  color: Colors.white.withOpacity(0.5),
//                  borderRadius: BorderRadius.circular(20.0),
//                ),
//                padding: EdgeInsets.all(20.0),
//                child: Text('Nearest station:\n ${widget.air.station}'),
//              ),
//              Padding(
//                padding: const EdgeInsets.all(50.0),
//                child: Container(
//                  decoration: BoxDecoration(
//                    color: Colors.white.withOpacity(0.5),
//                    borderRadius: BorderRadius.circular(20.0),
//                  ),
//                  padding: EdgeInsets.all(20.0),
//                  child: AQI(widget.air.aqi),
//                ),
//              ),
//              Text(
//                  "PM2.5: ${widget.air.pm25 != null ? widget.air.pm25 : 'no data available'}"),
//              Text(
//                  "PM10: ${widget.air.pm10 != null ? widget.air.pm10 : 'no data available'}"),
//              Text(
//                  "O3: ${widget.air.o3 != null ? widget.air.o3 : 'no data available'}"),
//              RaisedButton(
//                color: Colors.blueAccent,
//                onPressed: () {
//                  LoadingScreen(dataFromGeo: true);
//                },
//                child: Text(
//                  "Refresh using my location",
//                  style: TextStyle(color: Colors.white),
//                ),
//              ),
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
//            ],
//          ),
//        ),
//      ),
    );
  }
}
