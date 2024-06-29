import 'package:aplikasi_cuaca/providers/current_weather_provider.dart';
import 'package:aplikasi_cuaca/providers/hourly_weather_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_cuaca/screens/home_screen/home_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => WeatherCurrentProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => HourlyWeatherProvider(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Cuaca',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const HomeScreen(),
    );
  }
}
