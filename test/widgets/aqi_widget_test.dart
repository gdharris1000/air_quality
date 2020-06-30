import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:airquality1/widgets/aqi_widget.dart';

void main() {
  group('AQI 10', () {
    testWidgets('AQI widget test for Good level', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AQI(
              aqi: "10",
              level: 'Good',
            ),
          ),
        ),
      );

      final titleFinder = find.text('Air Quality Index Value');
      final levelFinder = find.text('Good');

      expect(titleFinder, findsOneWidget);
      expect(levelFinder, findsOneWidget);
    });
  });

  group('AQI 60', () {
    testWidgets('AQI widget test for Moderate level',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AQI(
              aqi: "60",
              level: "Moderate",
            ),
          ),
        ),
      );

      final titleFinder = find.text('Air Quality Index Value');
      final levelFinder = find.text('Moderate');

      expect(titleFinder, findsOneWidget);
      expect(levelFinder, findsOneWidget);
    });
  });

  group('AQI 110', () {
    testWidgets('AQI widget test for Unhealthy for Sensitive Groups',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AQI(
              aqi: "110",
              level: 'Unhealthy for Sensitive Groups',
            ),
          ),
        ),
      );

      final titleFinder = find.text('Air Quality Index Value');
      final levelFinder = find.text('Unhealthy for Sensitive Groups');

      expect(titleFinder, findsOneWidget);
      expect(levelFinder, findsOneWidget);
    });
  });

  group('AQI 160', () {
    testWidgets('AQI widget test for Unhealthy', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AQI(
              aqi: "160",
              level: 'Unhealthy',
            ),
          ),
        ),
      );

      final titleFinder = find.text('Air Quality Index Value');
      final levelFinder = find.text('Unhealthy');

      expect(titleFinder, findsOneWidget);
      expect(levelFinder, findsOneWidget);
    });
  });

  group('AQI 260', () {
    testWidgets('AQI widget test for Very Unhealthy',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AQI(
              aqi: "260",
              level: 'Very Unhealthy',
            ),
          ),
        ),
      );

      final titleFinder = find.text('Air Quality Index Value');
      final levelFinder = find.text('Very Unhealthy');

      expect(titleFinder, findsOneWidget);
      expect(levelFinder, findsOneWidget);
    });
  });

  group('AQI 360', () {
    testWidgets('AQI widget test for Hazardous', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Material(
            child: AQI(aqi: "360", level: 'Hazardous'),
          ),
        ),
      );

      final titleFinder = find.text('Air Quality Index Value');
      final levelFinder = find.text('Hazardous');

      expect(titleFinder, findsOneWidget);
      expect(levelFinder, findsOneWidget);
    });
  });
}
