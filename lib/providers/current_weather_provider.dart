import 'package:aplikasi_cuaca/models/api/current_weather_api.dart';
import 'package:aplikasi_cuaca/models/current_weather_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class WeatherCurrentProvider extends ChangeNotifier {
  bool _isLoading = false;
  WeatherCurrent? _weatherCurrent;

  WeatherCurrent? get weatherCurrent => _weatherCurrent;
  bool get isLoading => _isLoading;

  Future<void> fetchCurrentWeather() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await CurrentWeatherAPI.getCurrent();
      _weatherCurrent = data;
    } catch (e) {
      print('Error fetching weather data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
