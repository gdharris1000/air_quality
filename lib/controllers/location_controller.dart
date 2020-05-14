import 'package:geolocator/geolocator.dart';
import 'package:airquality1/models/location_model.dart';

class LocationController {
  Future<Location> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      Location location =
          Location(latitude: position.latitude, longitude: position.longitude);
      return location;
    } catch (e) {
      print(e);
    }
  }
}
