import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:airquality1/models/air_model.dart';
import 'package:airquality1/models/location_model.dart';
import 'package:airquality1/controllers/location_controller.dart';
import 'package:airquality1/controllers/air_controller.dart';

class AirData extends ChangeNotifier {
  Air air = Air(0, 'loading');

  void airFromGeo() async {
    LocationController locationController = LocationController();
    await locationController.getCurrentLocation().then((Location value) {
      AirController airController = AirController(value);
      updateAir(airController);
    });
  }

  void updateAir(AirController airController) async {}

  void airFromCity() {}
}
