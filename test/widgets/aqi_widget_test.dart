import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:airquality1/widgets/aqi_widget.dart';

void main() {

  group('AQI 10', (){
    testWidgets('AQI widget test', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AQI(10),
          ),
        ),
      );

      final titleFinder = find.text('Air Quality Index Value');

      expect(titleFinder, findsOneWidget);

    });
  });

}
