import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SnackBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar Demo'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget {
  SnackBarPage({super.key});

  final snackBar = SnackBar(
  content: const Text('Mesajınız Silindi'),
  action: SnackBarAction(
    label: 'Sil',
    onPressed: () {
      //print('Silme İşlemi Tamamlandı');
    },
  ),
);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: ElevatedButton(
        onPressed: (() {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }),
        child: const Text('Sil'),
      )),
    );
  }
}
