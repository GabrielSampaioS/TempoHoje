import 'package:tempo_hoje/app/model/location_model.dart';

abstract class WeatherDatasource {
  Future<List<LocationModel>> fetchLocationByCity(String city);
  Future<Map<String, dynamic>> fetchWeather({
    required double lat,
    required double lon,
  });
}
