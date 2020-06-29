import 'package:flutter/material.dart';

class AqiColourMixin {
  Color colourLevel(aqi) {
    if (aqi <= 50) {
      return Colors.green;
    } else if (aqi >= 51 && aqi <= 100) {
      return Colors.yellow;
    } else if (aqi >= 101 && aqi <= 150) {
      return Colors.orange;
    } else if (aqi >= 151 && aqi <= 200) {
      return Colors.red;
    } else if (aqi >= 201 && aqi <= 300) {
      return Color(0xff724deb);
    } else if (aqi > 300) {
      return Color(0xffb30231);
    }
    return Colors.green;
  }

  String textLevel(aqi) {
    if (aqi <= 50) {
      return "Good";
    } else if (aqi >= 51 && aqi <= 100) {
      return "Moderate";
    } else if (aqi >= 101 && aqi <= 150) {
      return "Unhealthy for Sensitive Groups";
    } else if (aqi >= 151 && aqi <= 200) {
      return "Unhealthy";
    } else if (aqi >= 201 && aqi <= 300) {
      return "Very Unhealthy";
    } else if (aqi > 300) {
      return "Hazardous";
    }
    return "Please wait";
  }
}
