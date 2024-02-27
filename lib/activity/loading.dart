import 'package:pras_weather/helper/getData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String location = "london";

  @override
  Widget build(BuildContext context) {
    String tempature;
    void finalData(String location) async {
      WeatherData instance = WeatherData(location: location);
      await instance.getData();

      if (instance.temperature.contains(".")) {
        tempature = instance.temperature
            .substring(0, instance.temperature.indexOf("."));
      } else {
        tempature = instance.temperature.substring(0, 2);
        if (tempature == "NA") {
          Navigator.pushReplacementNamed(context, "/error");
        }
      }

      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, "/home", arguments: {
          'loc_value': instance.location.toUpperCase(),
          'temp_value': tempature,
          'wind_value': instance.windSpeed.substring(0, 4),
          'weather_status': instance.weatherStatus,
          'weather_status_description':
              instance.weatherStatusDescription.toUpperCase(),
          'humidity_value': instance.humidity,
          'weather_icon': instance.weatherIcon,
        });
      });
    }

    Map<dynamic, dynamic>? userLocation =
        ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;

    if (userLocation != null && userLocation.isNotEmpty) {
      location = userLocation['userSearch'];
      finalData(location);
    }

    finalData(location);

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Color(0xFF2B4162),
          )),
      body: SafeArea(
          child: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF2B4162), Color(0xFF12100E)])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/weather.png',
                width: 250,
              ),
              SizedBox(height: 250),
              Text(
                "PRAS Weather",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: "KodeMono",
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Stay Ahead, Weatherwise',
                style: TextStyle(
                  color: Color.fromARGB(255, 156, 156, 156),
                  fontFamily: "KodeMono",
                  fontSize: 13,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SpinKitSpinningLines(
                color: Colors.white,
                size: 50.0,
              )
            ],
          ),
        ),
      )),
    );
  }
}
