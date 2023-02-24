import 'package:flutter/material.dart';

import 'ejemplo4_page.dart';

class Ejemplo3Page extends StatelessWidget {
  const Ejemplo3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Ejemplo4Page())),
              child: const Text('Siguiente ejemplo'),
            ),
          ],
        ),
      ),
    );
  }
}
