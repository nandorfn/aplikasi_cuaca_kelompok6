class WeatherCurrent {
  final double temperature;
  final String icon;
  final int humidity;
  final double windSpeed;
  final int visibility;

  WeatherCurrent({
    required this.temperature,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) {
    double tempKelvin = json['main']['temp'].toDouble();

    double tempCelsius = tempKelvin - 273.15;
    int visibilityMeters = json['visibility'];
    int visibilityKm = visibilityMeters ~/ 1000;

    return WeatherCurrent(
      temperature: tempCelsius.roundToDouble(),
      icon: json['weather'][0]['icon'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      visibility: visibilityKm,
    );
  }
}
