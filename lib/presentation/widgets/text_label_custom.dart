import 'package:flutter/material.dart';

Widget textLabelCustom (
    String text,
    TextAlign textAlign,
    Color color,
    double size,
    FontWeight fontWeight
    ) {
  return Text (
    text,
    textAlign: textAlign,
    style: TextStyle(
        color: color,
        fontSize: size,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight
    ),
  );
}