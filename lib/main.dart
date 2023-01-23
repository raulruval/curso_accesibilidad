import 'package:curso_accesibilidad/pages/ejemplo1_page.dart';
import 'package:curso_accesibilidad/pages/ejemplo2_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'ejemplo1',
      routes: {
        'ejemplo1': (_) => const Ejemplo1Page(),
        'ejemplo2': (_) => const Ejemplo2Page(),
      },
    );
  }
}
