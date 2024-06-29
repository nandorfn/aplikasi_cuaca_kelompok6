import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String time;
  final String? icon;
  final String temperature;

  const WeatherCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature
  });

  @override
  Widget build(BuildContext context) {
    String iconPath = icon != null ? 'assets/icons/$icon.png' : 'assets/icons/04d.png';

    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            time,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Image.asset(
              iconPath,
              width: 32,
              height: 32,
            ),
          ),
          Text(
            '$temperature°',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}