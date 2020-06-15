import 'package:airquality1/screens/display_data.dart';
import 'package:flutter/material.dart';
import 'package:airquality1/models/air_model.dart';
import 'package:airquality1/controllers/location_controller.dart';
import 'package:airquality1/controllers/air_controller.dart';
import 'package:airquality1/models/location_model.dart';

class LoadingScreen extends StatefulWidget {
  final bool dataFromGeo;
  String city = "";

  LoadingScreen({this.dataFromGeo, this.city});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String waiting = "waiting";

  @override
  void initState() {
    super.initState();

    if (widget.dataFromGeo == true) {
      getLocationData();
    } else {
      Location location = Location(city: widget.city);
      getAirData(location);
    }
  }

  void getLocationData() async {
    LocationController locationController = LocationController();
    await locationController.getCurrentLocation().then((value) {
      getAirData(value);
    });
  }

  void getAirData(location) async {
    AirController airController = AirController(location);
    await airController.getData(context).then((value) {
      setState(() {
        print("air data: ${value.station}");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DataView(value)));
        waiting = "not waiting";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.green,
            ),
          ),
          Text(waiting),
        ],
      ),
    );
  }
}
