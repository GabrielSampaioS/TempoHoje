import 'dart:convert';
import 'dart:io';
import 'package:tempo_hoje/app/datasources/weather_datasource.dart';
import 'package:tempo_hoje/app/model/location_model.dart';
import 'package:http/http.dart' as http;

class OpenWeatherDatasource implements WeatherDatasource {
  final http.Client client;
  final String apiKey;

  OpenWeatherDatasource({required this.client, required this.apiKey});

  static const _host = "api.openweathermap.org";

  @override
  Future<List<LocationModel>> fetchLocationByCity(String city) async {
    List<LocationModel> locations = <LocationModel>[];

    final uriFinal = Uri.https(_host, '/geo/1.0/direct', {
      'q': city,
      'limit': '5',
      'appid': apiKey,
    });

    final response = await client.get(uriFinal);

    //TODO melhorar isso e trasfomar num map de trapamento
    if (response.statusCode != 200) {
      throw HttpException("Erro ao buscar localização ${response.statusCode}");
    }

    for (dynamic location in json.decode(response.body)) {
      locations.add(LocationModel.fromMap(location));
    }

    //retornar uma lista
    return locations;
  }

  @override
  Future<Map<String, dynamic>> fetchWeather({
    required double lat,
    required double lon,
  }) async {
    final uriFinal = Uri.https(_host, '/data/2.5/weather', {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'appid': apiKey,
    });

    final response = await http.get(uriFinal);

    if (response.statusCode != 200) {
      throw Exception('Erro ao buscar clima');
    }

    return jsonDecode(response.body);
    
  }
}
