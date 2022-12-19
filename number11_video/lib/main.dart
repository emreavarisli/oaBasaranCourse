import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'RobotoMono'),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Font Kullanımı'),
        ),
        body: const AnaEkran(),
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
        child: Text(
          'Caramel',
          style: TextStyle(fontFamily: 'Caramel'),
        ),
      ),
    );
  }
}
