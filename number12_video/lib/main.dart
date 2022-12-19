import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ]),
            title: const Text('TabBar'),
          ),
          body: const TabBarView(children: [
            AnaEkran(),
            AnaEkran2(),
            AnaEkran3(),
          ]),
        ),
      ),
    );
  }
}

class AnaEkran extends StatelessWidget {
  const AnaEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Ekran 1'),
      ),
    );
  }
}

class AnaEkran2 extends StatelessWidget {
  const AnaEkran2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Ekran 2'),
      ),
    );
  }
}

class AnaEkran3 extends StatelessWidget {
  const AnaEkran3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: Text('Ekran 3'),
      ),
    );
  }
}
