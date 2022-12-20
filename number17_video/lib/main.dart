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
            title: const Text('Dismissible'),
          ),
          body: const AnaEkran(),
        ));
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List ogeler = ["Bir", "İki", "Üç", "Dört", "Beş", "Altı"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ogeler.length,
        itemBuilder: (context, indeksNumarasi) {
          return Dismissible(
            background: Container(color: Colors.red),
            key: Key(ogeler[indeksNumarasi]),
            onDismissed: ((direction) {
              setState(() {
                ogeler.removeAt(indeksNumarasi);
              });
            }),
            child: ListTile(
              title: Text(
                ogeler[indeksNumarasi],
              ),
            ),
          );
        });
  }
}
