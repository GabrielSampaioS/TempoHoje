import 'package:flutter/material.dart';
import 'package:tempo_hoje/app/datasources/weather_datasource.dart';
import 'package:tempo_hoje/app/model/location_model.dart';
import 'package:tempo_hoje/app/model/weather_model.dart';

class LocationByCityViewModel extends ChangeNotifier {
  final WeatherDatasource datasource;

  LocationByCityViewModel(this.datasource);

  // ===== Estado =====
  bool _loading = false;
  String? _error;

  List<LocationModel> _locations = [];
  LocationModel? _selectedLocation;

  WeatherModel? _today;

  // ===== Getters =====
  bool get loading => _loading;
  String? get error => _error;
  List<LocationModel> get locations => _locations;
  LocationModel? get selectedLocation => _selectedLocation;
  WeatherModel? get today => _today;

  // ===== Buscar cidade =====
  Future<void> fetchLocationByCity(String city) async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await datasource.fetchLocationByCity(city);
      _locations = result;
    } catch (e) {
      _error = 'Erro ao buscar cidade';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // ===== Selecionar cidade =====
  Future<void> selectLocation(LocationModel location) async {
    _selectedLocation = location;
    _locations = [];
    notifyListeners();

    await fetchTodayWeather(location);
  }

  Future<void> fetchTodayWeather(LocationModel location) async {
    try {
      _loading = true;
      notifyListeners();

      // MOCK (troca pela API depois)

      final result = await datasource.fetchWeather(
        lat: location.lat,
        lon: location.lon,
      );

      _today = WeatherModel.fromJson(result);

      _selectedLocation = null;
    } catch (e) {
      _error = 'Erro ao buscar clima';
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
