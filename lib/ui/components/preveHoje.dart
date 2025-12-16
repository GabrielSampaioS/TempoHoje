import 'package:flutter/material.dart';

class PreveHoje extends StatelessWidget {
  const PreveHoje({super.key});

  @override
  Widget build(BuildContext context) {
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

          // Temperatura atual
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Agora', style: TextStyle(color: Colors.white70)),
              Text(
                '32°C',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Min / Max
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Min 18°', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 4),
              Text('Max 33°', style: TextStyle(color: Colors.white70)),
            ],
          ),

          const SizedBox(width: 16),

          // Vento / Umidade
          Column(
            children: const [
              Row(
                children: [
                  Icon(Icons.wind_power, size: 16, color: Colors.white),
                  SizedBox(width: 4),
                  Text('35 km/h', style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 16,
                    color: Colors.white,
                  ),
                  SizedBox(width: 4),
                  Text('72%', style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
