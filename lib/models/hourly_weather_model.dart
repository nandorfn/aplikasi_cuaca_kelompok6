class HourlyWeather {
  final String time;
  final String icon;
  final String temp;

  HourlyWeather({
    required this.time,
    required this.icon,
    required this.temp,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    double tempKelvin = json['main']['temp'].toDouble();
    double tempCelsius = tempKelvin - 273.15;

    return HourlyWeather(
      time: json['dt_txt'].toString().substring(11, 16),
      icon: json['weather'][0]['icon'].toString(),
      temp: tempCelsius.round().toString(),
    );
  }
}
