import 'package:flutter/material.dart';

class AQI extends StatefulWidget {
  final int aqi;

  AQI(this.aqi);

  @override
  _AQIState createState() => _AQIState();
}

class _AQIState extends State<AQI> {
  String level = "checking level";

  Color checkLevel() {
    if (widget.aqi <= 50) {
      level = "Good";
      return Colors.green;
    } else if (widget.aqi >= 51 && widget.aqi <= 100) {
      level = "Moderate";
      return Colors.yellow;
    } else if (widget.aqi >= 101 && widget.aqi <= 150) {
      level = "Unhealthy for Sensitive Groups";
      return Colors.orange;
    } else if (widget.aqi >= 151 && widget.aqi <= 200) {
      level = "Unhealthy";
      return Colors.red;
    } else if (widget.aqi >= 201 && widget.aqi <= 300) {
      level = "Very Unhealthy";
      return Color(0xff724deb);
    } else if (widget.aqi > 300) {
      level = "Hazardous";
      return Color(0xffb30231);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              "Air Quality Index Value",
              textDirection: TextDirection.ltr,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
            decoration: BoxDecoration(
                color: checkLevel(),
                borderRadius: BorderRadius.circular((20.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(3.0, 3.0))
                ]),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    widget.aqi.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(level),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
