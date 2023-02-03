import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

Widget info_card(String title, String info) {
  return Container(
    // margin: EdgeInsets.all(26.0),
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 26.0),
    decoration: BoxDecoration(
      // border: Border.all(style: BorderStyle.solid),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 3.0,
        ),
        Text(
          info,
          style: TextStyle(
              color: Colors.deepPurple,
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
