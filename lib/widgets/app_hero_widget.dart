import 'package:flutter/material.dart';
import 'package:aplikasi_cuaca/widgets/gradient_text_widget.dart';

class AppHero extends StatelessWidget {
  final String? temperature;
  final String? icon;
  final bool isLoading;

  const AppHero({
    this.temperature,
    this.icon,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String iconPath = icon != null ? 'assets/icons/$icon.png' : 'assets/icons/04d.png';
    return SizedBox(
      height: 350,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            )
          else if (temperature != null && icon != null)
            Positioned(
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GradientText(
                    '${temperature.toString().split('.')[0]}°',
                    style: const TextStyle(
                      fontSize: 168,
                      fontWeight: FontWeight.w600,
                    ),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Color(0xFF5C88EB),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          if (icon != null)
            Positioned(
              top: 110,
              child: Image.asset(
                iconPath,
                width: 220,
                height: 220,
              ),
            ),
        ],
      ),
    );
  }
}
