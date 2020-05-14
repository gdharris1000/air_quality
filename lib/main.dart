import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/display_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Air Quality Checker',
      home: DataView(),
    );
  }
}
