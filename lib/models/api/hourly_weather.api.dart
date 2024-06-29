import 'package:aplikasi_cuaca/models/hourly_weather_model.dart';
import 'package:dio/dio.dart';

class HourlyWeatherAPI {
  static const String apiKey = 'f7ad372386d3237443da1f708461a5a0';
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/forecast?id=1642911&appid=';

  static Future<List<HourlyWeather>> getHourly() async {
    Dio dio = Dio();
    dio.options.validateStatus = (status) => status! < 500;
    List<HourlyWeather> hourlyList = [];

    try {
      final response = await dio.get('$baseUrl$apiKey');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['list'];
        hourlyList = data.map((json) => HourlyWeather.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load weather data: ${response.statusMessage}');
      }
    } catch (error) {
      rethrow;
    }
    return hourlyList;
  }
}
