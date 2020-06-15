import 'package:flutter/material.dart';
import 'package:airquality1/widgets/search_box.dart';
import 'package:airquality1/models/location_model.dart';
import 'package:airquality1/controllers/location_controller.dart';
import 'package:airquality1/models/air_model.dart';
import 'package:airquality1/controllers/air_controller.dart';
import 'package:airquality1/screens/loading_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  LocationController locationController = LocationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadingScreen(
                                  dataFromGeo: true,
                                )));
                  },
                  child: Text('Use my location'),
                ),
                CitySearch(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
