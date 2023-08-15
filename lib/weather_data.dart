// ignore_for_file: unused_import, unused_local_variable

import 'dart:convert';

import 'package:flutter_application_4/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherData {
  Future<Weather> getData(var latitude, var longitude) async {
    var uriCall = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=3ef44d0a70ac4a58a5495608230808&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uriCall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}
