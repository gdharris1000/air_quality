import 'package:airquality1/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:airquality1/screens/display_data.dart';

class CitySearch extends StatefulWidget {
  String searchText = "";
  @override
  _CitySearchState createState() => _CitySearchState();
}

class _CitySearchState extends State<CitySearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (value) {
              widget.searchText = value;
            },
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoadingScreen(
                            dataFromGeo: false,
                            city: widget.searchText,
                          )));
            },
          )
        ],
      ),
    );
  }
}
