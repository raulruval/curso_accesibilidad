import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:curso_accesibilidad/pages/ejemplo2_page.dart';
import 'package:flutter/material.dart';

class Ejemplo1Page extends StatefulWidget {
  const Ejemplo1Page({super.key});

  @override
  State<Ejemplo1Page> createState() => _Ejemplo1PageState();
}

class _Ejemplo1PageState extends State<Ejemplo1Page> {
  bool changeImage = false;
  List<Widget> imageList = [
    Image.asset('assets/img/singleBird.png'),
    Image.asset('assets/img/multipleBirds.png')
  ];
  CarouselController carusselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Semantics(
          label: 'Menú desplegable',
          child: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        title: const Text('Ejemplo 1'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Semantics(
              label: 'Notificaciones',
              child: IconButton(
                icon: const Icon(Icons.notification_add_outlined),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      changeImage = !changeImage;
                    });
                  },
                  child: const Text('Buscar elementos'),
                ),
                const SizedBox(
                  height: 50,
                ),
                Semantics(
                  liveRegion: true,
                  label: changeImage
                      ? 'Un resultado encontrado'
                      : 'Varios resultados encontrados',
                  child: SizedBox(
                    height: 150,
                    child: changeImage
                        ? Image.asset('assets/img/singleBird.png')
                        : Image.asset('assets/img/multipleBirds.png'),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Semantics(
                  label: 'Carrusel de imagenes',
                  slider: true,
                  onIncrease: () => carusselController.nextPage(),
                  onDecrease: () => carusselController.previousPage(),
                  explicitChildNodes: true,
                  child: CarouselSlider(
                    carouselController: carusselController,
                    items: imageList,
                    options: CarouselOptions(
                      height: 200,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Ejemplo2Page())),
                    child: const Text('Siguiente ejemplo'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
