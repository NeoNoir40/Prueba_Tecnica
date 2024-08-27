import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/on_boarding_screen.dart';
import 'screens/song_info.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';

void main() {
  runApp(const MyApp());
  // Cambiar el color de la barra de estado a un color específico (ejemplo: azul)
  FlutterStatusbarcolor.setStatusBarColor(const Color(0xFF2D2D2D));
  // Configurar los íconos de la barra de estado en color claro
  FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const BoardingScreen(),
        '/home': (context) => const HomeScreen(),
        '/song': (context) => SongScreen(),
      },
    );
  }
}
