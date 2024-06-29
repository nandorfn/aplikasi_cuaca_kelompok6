import 'package:aplikasi_cuaca/providers/current_weather_provider.dart';
import 'package:aplikasi_cuaca/providers/hourly_weather_provider.dart';
import 'package:aplikasi_cuaca/widgets/weather_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aplikasi_cuaca/widgets/weather_bar_widget.dart';
import 'package:aplikasi_cuaca/widgets/app_hero_widget.dart';
import 'package:aplikasi_cuaca/widgets/status_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<WeatherCurrentProvider>(context, listen: false).fetchCurrentWeather();
      Provider.of<HourlyWeatherProvider>(context, listen: false).fetchHourlyWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.5),
            radius: 1,
            colors: [Color(0xFF67A0EF), Color(0xFF5274E8)],
          ),
        ),
        child: Consumer<WeatherCurrentProvider>(
          builder: (context, weatherProvider, _) {
            return Consumer<HourlyWeatherProvider>(
              builder: (context, hourlyWeatherProvider, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    const StatusBar(),
                    AppHero(
                      temperature: weatherProvider.weatherCurrent?.temperature.toString() ?? "",
                      icon: weatherProvider.weatherCurrent?.icon ?? "",
                      isLoading: weatherProvider.isLoading,
                    ),
                    Expanded(
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            top: -10,
                            child: Container(
                              margin: const EdgeInsets.only(top: 70),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  const Padding(
                                    padding: EdgeInsets.only(top: 70, left: 16, right: 16, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          'Today',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Next 5 Days',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  if (hourlyWeatherProvider.hourlyList != null && hourlyWeatherProvider.hourlyList!.isNotEmpty)
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 10),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: hourlyWeatherProvider.hourlyList!.length,
                                          itemBuilder: (context, index) {
                                            final weather = hourlyWeatherProvider.hourlyList![index];
                                            return WeatherCard(
                                              time: weather.time,
                                              icon: weather.icon,
                                              temperature: weather.temp,
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  else
                                    const Expanded(
                                      child: Center(
                                        child: Text(
                                          'No hourly weather data available.',
                                          style: TextStyle(fontSize: 16, color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: WeatherBar(
                              wind: weatherProvider.weatherCurrent?.windSpeed,
                              humidity: weatherProvider.weatherCurrent?.humidity,
                              visibility: weatherProvider.weatherCurrent?.visibility,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
