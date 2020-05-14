import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:airquality1/screens/loading_screen.dart';
import 'package:airquality1/main.dart';

void main() {
  testWidgets('hello', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    final helloFinder = find.text('hello');
    expect(helloFinder, findsOneWidget);
  });
}
