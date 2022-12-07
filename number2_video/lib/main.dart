import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "İlkel Blog Uygulaması",
      home: AnaEkran(),
    );
  }
}

class AnaEkran extends StatelessWidget {
  const AnaEkran({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Uygulaması'),
      ),
      body: Container(
        margin: const EdgeInsets.all(50),
        child: const Center(
          child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eleifend erat ex, et iaculis ipsum molestie quis. Curabitur ultricies lacinia leo id sodales. Phasellus aliquam, lectus eu fermentum euismod, ante metus placerat turpis, at pretium dolor nisl non nibh. Sed dictum nibh in metus congue, id maximus nibh mattis. Maecenas vehicula libero at felis suscipit mollis. Etiam justo purus, commodo id aliquam in, porttitor nec elit. Ut lorem quam, pharetra ut turpis a, dignissim mattis sem. Phasellus vitae nulla turpis. Nunc vitae scelerisque mi. Suspendisse pulvinar vehicula justo, in tincidunt lorem laoreet in. Donec tincidunt faucibus augue eget ornare. Sed tortor eros, laoreet quis gravida non, pretium sit amet nulla. Aenean facilisis placerat vehicula.'),
        ),
      ),
    );
  }
}