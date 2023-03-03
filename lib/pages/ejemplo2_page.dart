import 'package:flutter/material.dart';

import 'ejemplo3_page.dart';

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
            const SizedBox(
              height: 100,
            ),
            const ExcludeSemantics(
                child: Text('Esto no quiero que me lo digas...')),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              child: Semantics(
                link: true,
                hint: 'External link',
                child: const ExcludeSemantics(
                  child: Text(
                    'Link to external page Title',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
              ),
              onTap: () {
                print('Go to external page');
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Ejemplo3Page())),
              child: const Text('Siguiente ejemplo'),
            ),
          ],
        ),
      ),
    );
  }
}
