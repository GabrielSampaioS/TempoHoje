import 'dart:convert';

class LocationModel {
  final String name;
  final double lat;
  final double lon;
  final String country;
  final String? state;

  const LocationModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    this.state,
  });

  /// Converte JSON (API) → Model
  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      name: map['name'] as String,
      lat: (map['lat'] as num).toDouble(),
      lon: (map['lon'] as num).toDouble(),
      country: map['country'] as String,
      state: map['state'] as String?,
    );
  }

  /// Converte Model → Map (persistência / debug)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lat': lat,
      'lon': lon,
      'country': country,
      'state': state,
    };
  }

  /// JSON string → Model
  factory LocationModel.fromJson(String source) =>
      LocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Model → JSON string
  String toJson() => json.encode(toMap());
}
