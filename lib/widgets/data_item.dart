import 'package:flutter/material.dart';

class DataItem extends StatelessWidget {
  final String value;
  final String label;

  DataItem({this.value, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60.0, right: 60.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(label),
          Text("${value != null ? value : 'no data available'}")
        ],
      ),
    );
  }
}
