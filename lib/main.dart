import 'package:flutter/material.dart';
import 'package:myapp/mispantallas/Inicio.dart';
import 'package:myapp/mispantallas/pantalla2.dart';
import 'package:myapp/mispantallas/pantalla3.dart';

void main() => runApp(const DisenosApp());

class DisenosApp extends StatelessWidget {
  const DisenosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Diseños App",
      initialRoute: '/', // Opcional, si quieres definir la ruta inicial
      routes: {
        '/': (context) => const Inicio(),
        '/pantalla2': (context) => const Pantalla2(),
        '/pantalla3': (context) => const Pantalla3(),
      },
    );
  }
}
