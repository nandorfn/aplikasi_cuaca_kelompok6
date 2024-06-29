import 'package:aplikasi_cuaca/models/current_weather_model.dart';
import 'package:dio/dio.dart';

class CurrentWeatherAPI {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/weather?id=1642911&appid=';
  static const String apiKey = 'f7ad372386d3237443da1f708461a5a0';

  static Future<WeatherCurrent?> getCurrent() async {
    Dio dio = Dio();
    dio.options.validateStatus = (status) => status! < 500;
    WeatherCurrent? weatherData;

    try {
      final response = await dio.get('$baseUrl$apiKey');

      if (response.statusCode == 200) {
        final data = WeatherCurrent.fromJson(response.data);
        weatherData = data;
      } else {
        throw Exception('Failed to load weather data: ${response.statusMessage}');
      }
    } catch (error) {
      rethrow;
    }

    return weatherData;
  }
}
