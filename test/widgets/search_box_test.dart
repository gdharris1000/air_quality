import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:airquality1/widgets/search_box.dart';

void main() {
  testWidgets('Search Box', (WidgetTester tester) async {
    CitySearch citySearch = CitySearch();
    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: citySearch,
        ),
      ),
    );
    await tester.enterText(find.byType(TextField), 'London');

    expect(citySearch.searchText, equals('London'));
    expect(find.text('Search for city'), findsOneWidget);
  });
}
