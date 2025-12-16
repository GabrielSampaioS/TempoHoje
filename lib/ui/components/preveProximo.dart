import 'package:flutter/material.dart';

class PreveProximo extends StatelessWidget {
  const PreveProximo({super.key});

  @override
  Widget build(BuildContext context) {
    final dias = [
      ("16/12", Icons.sunny, "10°"),
      ("17/12", Icons.sunny_snowing, "6°"),
      ("18/12", Icons.snowing, "8°"),
      ("19/12", Icons.snowing, "8°"),
      ("20/12", Icons.snowing, "-1°"),
      ("21/12", Icons.storm_outlined, "5°"),
      ("22/12", Icons.storm_outlined, "1°"),
    ];

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: dias.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final (data, icon, temp) = dias[index];

          return Container(
            width: 72,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                Icon(icon, color: Colors.white, size: 28),
                Text(
                  temp,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
