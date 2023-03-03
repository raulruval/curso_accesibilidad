import 'package:flutter/material.dart';

import 'ejemplo4_page.dart';

class Ejemplo3Page extends StatefulWidget {
  const Ejemplo3Page({super.key});

  @override
  State<Ejemplo3Page> createState() => _Ejemplo3PageState();
}

class _Ejemplo3PageState extends State<Ejemplo3Page>
    with SingleTickerProviderStateMixin {
  final List<String> items = List<String>.generate(10, (i) => "Item ${i + 1}");
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text('Lista de elementos'),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Semantics(
                      label: 'Has seleccionado el item ${index + 1}',
                      child: ListTile(
                        title: Text(items[index]),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Ejemplo4Page())),
                child: const Text('Siguiente ejemplo'),
              ),
            ],
          ),
          const Center(child: Text('This is the second tab')),
          const Center(child: Text('This is the third tab')),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: TabBar(
          controller: _tabController,
          tabs: const <Tab>[
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: 'Settings',
            ),
            Tab(
              icon: Icon(Icons.help),
              text: 'Help',
            ),
          ],
        ),
      ),
    );
  }
}
