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
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${today.nameCity} - ${today.nameCountry}",
            style: const TextStyle(color: Colors.white70),
          ),

          const SizedBox(height: 12),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //const Icon(Icons.sunny_snowing, size: 48, color: Colors.white),
              Image.network(
                ("https://openweathermap.org/img/wn/${today.iconWeatherUrl}@2x.png"),
                width: 48,
                height: 48,
              ),
              Text(
                '${today.temperature.round() - 273}°C',
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),

              const SizedBox(width: 12),

              // Min / Max
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Min ${today.tempMin.round() - 273}°C',
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Max ${today.tempMax.round() - 273}°C',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),

              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.water_drop_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${today.humidity}%',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.wind_power_outlined,
                        size: 16,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${today.windSpeed} m/s',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Text(
            ("${today.description[0].toUpperCase()}${today.description.substring(1)}"),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
