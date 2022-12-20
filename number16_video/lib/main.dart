import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InkWell Kullanımı'),
        ),
        body: const MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        hoverColor: Colors.red,
        onDoubleTap: () {
          print('Butona Çift Tıklandı');
        },
        onTap: () {
          print('Butona Tek Tıklandı');
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: const Text('Buton'),
        ),
      ),
    );
  }
}
