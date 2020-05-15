import 'package:test/test.dart';
import 'package:airquality1/controllers/air_controller.dart';
import 'package:mockito/mockito.dart';
import 'package:airquality1/models/location_model.dart';

class MockLocation extends Mock implements Location {}

void main() {
  var location = MockLocation();
  when(location.longitude).thenReturn(-52.129409);
  when(location.latitude).thenReturn(70.675069);
  AirController airController = AirController(location);

  test('check mocking location worked', () {
    expect(airController.location.latitude, equals(70.675069));
    expect(airController.location.longitude, equals(-52.129409));
  });
}
