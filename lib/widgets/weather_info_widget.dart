import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final String label;
  final String value;
  final String icon;

  const WeatherInfo({super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    String iconPath = 'assets/icons/$icon.png';
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            alignment: Alignment.center,
            iconPath,
            width: 32,
            height: 32,
          ),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFD6D6D6),
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}
