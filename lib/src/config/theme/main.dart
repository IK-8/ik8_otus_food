import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const primaryColor = Color.fromRGBO(46, 204, 113, 1.0);
const backgroundColor = Color(0xffECECEC);
final primaryMaterial = MaterialColor(
  const Color.fromRGBO(46, 204, 113, 1.0).value,
  const <int, Color>{
    50: Color.fromRGBO(46, 204, 113, 0.1),
    100: Color.fromRGBO(46, 204, 113, 0.2),
    200: Color.fromRGBO(46, 204, 113, 0.3),
    300: Color.fromRGBO(46, 204, 113, 0.4),
    400: Color.fromRGBO(46, 204, 113, 0.5),
    500: Color.fromRGBO(46, 204, 113, 0.6),
    600: Color.fromRGBO(46, 204, 113, 0.7),
    700: Color.fromRGBO(46, 204, 113, 0.8),
    800: Color.fromRGBO(46, 204, 113, 0.9),
    900: Color.fromRGBO(46, 204, 113, 1),
  },
);
final theme = ThemeData(
  primarySwatch: primaryMaterial,
  backgroundColor: backgroundColor,
  scaffoldBackgroundColor: backgroundColor,
);

const transparentSystemOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: backgroundColor,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);
