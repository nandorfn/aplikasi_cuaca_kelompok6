import 'package:aplikasi_cuaca/models/api/hourly_weather.api.dart';
import 'package:aplikasi_cuaca/models/hourly_weather_model.dart';
import 'package:flutter/cupertino.dart';

class HourlyWeatherProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<HourlyWeather>? _hourlyList;

  List<HourlyWeather>? get hourlyList => _hourlyList;
  bool get isLoading => _isLoading;

  Future<void> fetchHourlyWeather() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await HourlyWeatherAPI.getHourly();
      _hourlyList = data;
    } catch (e) {
      print('Error fetching weather data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
