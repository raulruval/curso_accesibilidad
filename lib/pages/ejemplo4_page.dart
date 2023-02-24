import 'package:flutter/material.dart';

class Ejemplo4Page extends StatefulWidget {
  const Ejemplo4Page({super.key});

  @override
  State<Ejemplo4Page> createState() => _Ejemplo4PageState();
}

class _Ejemplo4PageState extends State<Ejemplo4Page> {
  Offset dragGesturePositon = Offset.zero;
  bool showMagnify = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MergeSemantics(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Otras herramietas:',
                style: TextStyle(fontSize: 25, color: Colors.blue),
              ),
              const SizedBox(
                height: 20,
              ),
              const ExcludeSemantics(
                child: Text(
                  'Pequeño cuento:',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              RepaintBoundary(
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                        onPanEnd: (_) => setState(() {
                              showMagnify = false;
                            }),
                        onPanUpdate: (DragUpdateDetails details) => setState(
                              () {
                                showMagnify = true;
                                dragGesturePositon = details.localPosition;
                              },
                            ),
                        child: const Padding(
                          padding: EdgeInsets.all(25),
                          child: Text(
                            'La lluvia golpeaba con fuerza la casa de campo mientras la familia se refugiaba dentro, sobreviviendo a una tormenta que los dejó varados y aislados durante la noche, pero juntos y a salvo, recordando la experiencia con cariño.',
                            style: TextStyle(fontSize: 24),
                          ),
                        )),
                    Positioned(
                      left: dragGesturePositon.dx,
                      top: dragGesturePositon.dy,
                      child: showMagnify
                          ? const RawMagnifier(
                              decoration: MagnifierDecoration(
                                shape: RoundedRectangleBorder(
                                    side:
                                        BorderSide(color: Colors.red, width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                              ),
                              size: Size(100, 50),
                              magnificationScale: 2,
                            )
                          : const SizedBox(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
