// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_4/weather_data.dart';
import 'package:flutter_application_4/weather_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

var dayInfo = DateTime.now();
var dateFormat = DateFormat("EEE, d MMM, yyyy").format(dayInfo);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var client = WeatherData();
  bool isLoading = true;
  late Weather data;

  info() async {
    // var position = await GetPosition();
    data = await client.getData("41.32", "69.25");
    isLoading = false;
    return data;
  }


  ///---Widgets---

  Widget dataofweather(String nameOfFirstText, String dataofGust,
          String nameOFSecondtext, String dataOfPressure) =>
      const SizedBox();

  Widget get lastPage => Row(children: [
        dataofweather(
            "Gust", "${data.gust} kp/h", "Pressure", "${data.pressure} hp"),
        dataofweather("UV", "${data.uv}", "Precipitation", "${data.pricipe}"),
        dataofweather(
            "Wind", "${data.wind}", "Last Update", "${data.lastUpdate}")
      ]);

  Widget containerPage(double size) => Container(
      height: size * 0.75,
      width: size,
      padding: const EdgeInsets.only(top: 60),
      margin: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
              colors: [Color(0xff955cd1), Color(0xff3fa2fa)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.2, 0.85])),
      child: Column(children: [
        cityName,
        const SizedBox(height: 10),
        Text(
          dateFormat,
          style: GoogleFonts.mavenPro(fontSize: 18, color: Colors.white),
        ),
        imageOfWeatherIcon(500),
        condition,
        const SizedBox(height: 5),
        tempOfWeather,
        const SizedBox(height: 20),
        Row(children: [
          weatherThings(
              "assets/images/sand.png", 400, "${data.wind} km/h", "Wind"),
          weatherThings("assets/images/humidity.png", 400, "${data.humidity}",
              "Humidity"),
          weatherThings("assets/images/wind-direction.png", 400,
              '${data.windDir}', "WindDirection")
        ])
      ]));

  Widget textOfNumbersWidget(String textofNumbers) => Text(textofNumbers,
      style: GoogleFonts.hubballi(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold));

  Widget weatherThings(
          String textofimage, double size, String textofNumbers, String text) =>
      Expanded(
          child: Column(children: [
        Image.asset(textofimage, width: size * 0.15),
        const SizedBox(height: 10),
        textOfNumbersWidget(textofNumbers),
        const SizedBox(height: 10),
        Text(text,
            style: GoogleFonts.mavenPro(
                color: Colors.white.withOpacity(0.6),
                fontSize: 17,
                fontWeight: FontWeight.bold))
      ]));

  Widget get tempOfWeather => Text("${data.temp}",
      style: GoogleFonts.hubballi(
          fontSize: 75, fontWeight: FontWeight.w800, color: Colors.white));

  Widget get condition => Text("${data.condition}",
      style: GoogleFonts.hubballi(
          fontSize: 40, fontWeight: FontWeight.w600, color: Colors.white));

  Widget imageOfWeatherIcon(double size) =>
      Image.network('https:${data.icon}', width: size * 0.36, fit: BoxFit.fill);

  Widget get cityName => Text('${data.cityName}',
      style: GoogleFonts.mavenPro(color: Colors.white, fontSize: 35));

  Widget get bodyOfPage => FutureBuilder(
      future: info(),
      builder: (context, snapshot) => isLoading
          ? const Center(child: CupertinoActivityIndicator(color: Colors.white))
          : Container(
              child: Column(children: [
              containerPage(830),
              const SizedBox(height: 20),
              lastPage,
            ])));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(body: bodyOfPage);
  }
}
