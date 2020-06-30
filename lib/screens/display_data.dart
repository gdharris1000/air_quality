import 'package:airquality1/screens/loading_screen.dart';
import 'package:airquality1/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:airquality1/models/air_model.dart';
import 'package:airquality1/widgets/data_item.dart';
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
                flex: 10,
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
                DataItem(label: "PM2.5", value: widget.air.pm25.toString()),
                DataItem(label: "PM10", value: widget.air.pm10.toString()),
                DataItem(label: "O3", value: widget.air.o3.toString()),
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
    );
  }
}
