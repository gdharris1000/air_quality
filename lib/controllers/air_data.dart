import 'package:flutter/foundation.dart';
import 'package:airquality1/models/air_model.dart';

class AirData extends ChangeNotifier {
  Air air = Air(0, 'loading');

  void airFromGeo() {}

  void airFromCity() {}
}
