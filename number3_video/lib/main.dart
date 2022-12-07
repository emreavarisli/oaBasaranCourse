import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "İlkel Blog Uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Uygulaması'),
      ),
      body: const AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  String blogYazisi = 'Bloga Hoşgeldiniz';

  martGoster() {
    setState(() {
      blogYazisi = 'martyafsfsfsf';
    });
  }

  nisanGoster(){
    setState(() {
      blogYazisi = 'nisansdfsdafs';
    });
  }

  mayisGoster(){
    setState(() {
      blogYazisi = 'mayissdfsdafs';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(blogYazisi),
            ElevatedButton(
              onPressed: martGoster,
              child: const Text('Mart Yazısı'),
            ),
            ElevatedButton(
              onPressed: nisanGoster,
              child: const Text('Nisan Yazısı')
            ),
            ElevatedButton(
              onPressed: mayisGoster,
              child: const Text('Mayıs Yazısı')
            ),
          ],
        ),
      ),
    );
  }
}
