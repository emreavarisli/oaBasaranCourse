import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const AnaEkran(),
      ),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (deger) {
                if (deger!.isEmpty) {
                  return 'Lütfen kullanıcı adı girin';
                }
                return null;
              },
            ),
            TextFormField(
              validator: (deger) {
                if (deger!.length < 8) {
                  return 'Lütfen daha uzun şifre girin girin';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  //print("Kullnaıcı kaydı yapılıyor");

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kullanıcı kaydediliyor')),
                  );
                }
              },
              child: const Text('Onayla'),
            ),
          ],
        ));
  }
}
