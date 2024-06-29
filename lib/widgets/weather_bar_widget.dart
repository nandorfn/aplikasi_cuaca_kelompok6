import 'package:flutter/material.dart';
import 'package:aplikasi_cuaca/widgets/weather_info_widget.dart';

class WeatherBar extends StatelessWidget {
  final int? humidity;
  final double? wind;
  final int? visibility;

  const WeatherBar({
    this.humidity,
    this.wind,
    this.visibility,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.94,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
                color: Color(0x0F000000),
                blurRadius: 6.80,
                offset: Offset(0, 4),
                spreadRadius: 3,
            ),
          ],
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            WeatherInfo(icon: 'wind', label: 'Wind', value: "${wind}km/h"),
            WeatherInfo(icon: 'humidity', label: 'Humidity', value: '$humidity%'),
            WeatherInfo(icon: 'vector', label: 'Visibility', value: '${visibility}km'),
          ],
        ),
      ),
    );
  }
}
