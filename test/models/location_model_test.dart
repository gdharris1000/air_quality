import 'package:test/test.dart';
import 'package:airquality1/models/location_model.dart';

void main() {
  group('Location setup', () {
    Location location =
        Location(latitude: 70.675069, longitude: -52.129409, city: "Uummannaq");

    test('location can receive a latitude value', () {
      expect(location.latitude, equals(70.675069));
    });

    test('location can receive a longitude value', () {
      expect(location.longitude, equals(-52.129409));
    });

    test('location can receive a city', () {
      expect(location.city, equals("Uummannaq"));
    });
  });
}
