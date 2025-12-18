import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tempo_hoje/app/model/location_model.dart';
import 'package:tempo_hoje/app/viewmodels/location_by_city.dart';
import 'package:tempo_hoje/ui/components/preveHoje.dart';
import 'package:tempo_hoje/ui/components/preveProximo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LocationByCityViewModel>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF4A90E2), Color(0xFF50A7F9)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // BUSCA DE CIDADE
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextField(
                    controller: textController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      icon: Icon(Icons.search, color: Colors.white),
                      hintText: 'Piracicaba',
                      hintStyle: TextStyle(color: Colors.white70),
                      border: InputBorder.none,
                    ),
                    onSubmitted: (city) {
                      viewModel.fetchLocationByCity(city);
                    },
                  ),
                ),

                // ESTADOS
                if (viewModel.loading)
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Center(child: CircularProgressIndicator()),
                  ),

                if (viewModel.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      viewModel.error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),

                if (viewModel.locations.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: viewModel.locations.length,
                      itemBuilder: (context, index) {
                        final LocationModel location =
                            viewModel.locations[index];

                        return ListTile(
                          title: Text(
                            location.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            location.state ?? '',
                            style: const TextStyle(color: Colors.white70),
                          ),
                          onTap: () {
                            viewModel.selectLocation(location);
                            textController.text = location.name;
                          },
                        );
                      },
                    ),
                  ),

                const SizedBox(height: 16),

                // REVISÃO DE HOJE
                const PreveHoje(),

                const SizedBox(height: 16),

                // PRÓXIMOS DIAS
                const PreveProximo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
