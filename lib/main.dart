import 'package:flutter/material.dart';
import 'package:pras_weather/activity/home.dart';
import 'package:pras_weather/activity/loading.dart';
import 'package:pras_weather/activity/error.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Loading(),
      "/home": (context) => Home(),
      "/loading": (context) => Loading(),
      "/error": (context) => Error(),

    },
    theme: ThemeData(
      fontFamily: "Poppins",
    ),
  ));
}
