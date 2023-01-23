import 'package:flutter/material.dart';

class Ejemplo2Page extends StatelessWidget {
  const Ejemplo2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(50),
        child: Column(
          children: [
            MergeSemantics(
              child: Row(
                children: const [
                  Text(
                    'Tipo de curso',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 25,
                    ),
                  ),
                  Text(
                    'Accesibilidad',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MergeSemantics(
              child: Row(
                children: const [
                  Text(
                    'Año:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 25,
                    ),
                  ),
                  Text(
                    '2023',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MergeSemantics(
              child: Row(
                children: const [
                  Text(
                    'Idioma:',
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 25,
                    ),
                  ),
                  Text(
                    'Español',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
