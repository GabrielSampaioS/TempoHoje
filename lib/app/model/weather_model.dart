class WeatherModel {
  final double temperature;
  final double feelsLike;
  final int humidity;
  final String description;
  final String nameCity;
  final String nameCountry;
  final String windSpeed;

  WeatherModel({
    required this.temperature,
    required this.feelsLike,
    required this.humidity,
    required this.description,
    required this.nameCity,
    required this.nameCountry,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: (json['main']['temp'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      humidity: json['main']['humidity'],
      description: json['weather'][0]['description'],
      nameCountry: json['sys']['country'],
      nameCity: json['name'],
      windSpeed: json['wind']['speed'].toString(),
    );
  }
}
