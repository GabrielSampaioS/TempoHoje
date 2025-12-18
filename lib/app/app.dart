import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:tempo_hoje/ui/screens/home_page.dart';
import 'package:tempo_hoje/app/datasources/weather_datasource.dart';
import 'package:tempo_hoje/app/datasources/openweather_datasource.dart';
import 'package:tempo_hoje/app/viewmodels/location_by_city.dart';

class Tempohoje extends StatelessWidget {
  const Tempohoje({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<http.Client>(
          create: (_) => http.Client(),
          dispose: (_, client) => client.close(),
        ),

        Provider<WeatherDatasource>(
          create: (context) => OpenWeatherDatasource(
            client: context.read<http.Client>(),
            apiKey: dotenv.env['OPEN_WEATHER_KEY']!,
          ),
        ),

        ChangeNotifierProvider<LocationByCityViewModel>(
          create: (context) =>
              LocationByCityViewModel(context.read<WeatherDatasource>()),
        ),
      ],
      child: MaterialApp(title: 'Tempo Hoje', home: const HomePage()),
    );
  }
}
