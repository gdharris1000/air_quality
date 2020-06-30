import 'package:flutter/material.dart';

class AQI extends StatelessWidget {
  final String aqi;
  final String level;

  AQI({this.aqi, this.level});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text('Air Quality Index Value'),
          ),
          Center(
            child: Text(
              aqi,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60.0),
            ),
          ),
          Center(
            child: Text(
              level,
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
