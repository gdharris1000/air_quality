import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:geolocator/geolocator.dart';
import 'package:airquality1/controllers/location_controller.dart';

class MockGeo extends Mock implements Geolocator {}

void main() {
  var geo = MockGeo();
}
