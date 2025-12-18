import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempo_hoje/app/model/weather_model.dart';
import 'package:tempo_hoje/app/viewmodels/location_by_city.dart';

class PreveHoje extends StatelessWidget {
  const PreveHoje({super.key});

  @override
  Widget build(BuildContext context) {
    final today = context.select<LocationByCityViewModel, WeatherModel?>(
      (vm) => vm.today,
    );

    if (today == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.sunny_snowing, size: 48, color: Colors.white),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ("${today.nameCity} - ${today.nameCountry}"),
                style: const TextStyle(color: Colors.white70),
              ),
              Text(
                '${today.temperature.round()}°F',
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                'Sensação ${today.feelsLike.round()}°',
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),

          Column(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.water_drop_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${today.humidity}%',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.wind_power_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${today.windSpeed}Km/h',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
