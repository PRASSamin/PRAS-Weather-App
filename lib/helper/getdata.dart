import 'package:http/http.dart';
import 'dart:convert';

String apiKey = "YOUR_API_KEY";

class WeatherData {
  String location = '';
  String temperature = '';
  String windSpeed = '';
  String weatherStatus = '';
  String weatherStatusDescription = '';
  String humidity = '';
  String weatherIcon = '';

  WeatherData({required this.location}) {
    location = this.location;
  }

  Future<void> getData() async {
    try {
      Uri url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$location&units=metric&appid=$apiKey');
      Response response = await get(url);
      Map weatherDatas = json.decode(response.body);

      Map weatherStatusGroup = weatherDatas['weather'][0];
      weatherStatus = weatherStatusGroup['main'];
      weatherStatusDescription = weatherStatusGroup['description'];
      weatherIcon = weatherStatusGroup['icon'];

      Map tempatureGroup = weatherDatas['main'];
      temperature = (tempatureGroup['temp']).toString();
      humidity = (tempatureGroup['humidity']).toString();

      Map windGroup = weatherDatas['wind'];
      windSpeed = (windGroup['speed'] * 3.6).toString();
    } catch (e) {
      temperature = "NA";
    }
  }
}
