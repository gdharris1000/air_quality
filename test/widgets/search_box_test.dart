import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:airquality1/widgets/search_box.dart';

void main() {
  testWidgets('Search Box', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: CitySearch(),
        ),
      ),
    );

    expect(find.text('Submit'), findsOneWidget);
  });
}
