import 'package:flutter/material.dart';

final lightColor = Color(0xFFFEFEFE);
final darkColor = Color(0xFF090f34);
final backgroundBtnColor = Color(0xff262b4e);
final appBarShadowColor = Colors.black;

final buttonStyle = TextButton.styleFrom(
    backgroundColor: backgroundBtnColor,
    foregroundColor: lightColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7),
    ));

final double widthBtn = 150.0;
final double heightBtn = 120.0;
final borderRadBtn = BorderRadius.circular(7);
final textStyleBtn = TextStyle(fontSize: 16);

final textStyleCounter = TextStyle(
    fontSize: 40, color: Colors.blue[700], fontWeight: FontWeight.bold);

final double widthIcon = 45.0;
final double heightIcon = 45.0;
