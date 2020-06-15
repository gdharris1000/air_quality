import 'package:airquality1/models/air_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/display_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Air(0, "loading"),
      child: MaterialApp(
        title: 'Air Quality Checker',
        home: DataView(),
      ),
    );
  }
}
