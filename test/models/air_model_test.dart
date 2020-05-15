import 'package:test/test.dart';
import 'package:airquality1/models/air_model.dart';

void main() {
  group('Air setup', () {
    Air air = Air(34, 'Station name');

    test('air receives aqi value', () {
      expect(air.aqi, equals(34));
    });

    test('air receives station name', () {
      expect(air.station, equals('Station name'));
    });
  });
}
