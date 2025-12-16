import 'package:tempo_hoje/ui/screens/home_page.dart';

import 'package:flutter/material.dart';

class Tempohoje extends StatelessWidget {
  const Tempohoje({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tempo Hoje",
      theme: ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorSchemeSeed: Color.fromRGBO(74, 144, 226, 1),
      ),
      home: HomePage(),
    );
  }
}
