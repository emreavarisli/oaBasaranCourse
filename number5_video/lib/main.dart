import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => const GirisEkrani(),
        "/ProfilSayfasiRotasi": (context) => const ProfilEkrani(),
      },
    );
  }
}

class GirisEkrani extends StatefulWidget {
  const GirisEkrani({super.key});

  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();

  girisYap() {
    if (t1.text == "admin" && t2.text = "1234") {
      Navigator.pushNamed(context, "/ProfilSayfasiRotasi",
        arguments: VeriModeli(kullaniciAdi: t1.text, sifre: t2.text));
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Yanlış kullanıcı adı veya şifre"),
            content: const Text("Lütfen giriş bilgilerinizi gözden geçirin."),
            actions: <Widget>[
               ElevatedButton(
                child: const Text("Kapat"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      ); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Giriş Ekranı")),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(100),
          child: Column(children: [
            TextFormField(decoration: const InputDecoration(hintText: "Kullanıcı Adı"), controller: t1),
            TextFormField(decoration: const InputDecoration(hintText: "Şifre"), controller: t2),
            ElevatedButton(onPressed: girisYap, child: const Text("Giriş Yap"))
          ]),
        ),
      ),
    );
  }
}

class ProfilEkrani extends StatefulWidget {
  const ProfilEkrani({super.key});

  @override
  State<ProfilEkrani> createState() => _ProfilEkraniState();
}

class _ProfilEkraniState extends State<ProfilEkrani> {
  cikisYap() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    VeriModeli iletilenArgumanlar = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(title: const Text("Profil Sayfası")),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(children: [
          ElevatedButton(onPressed: cikisYap, child: const Text("Çıkış Yap")),
          Text(iletilenArgumanlar.kullaniciAdi),
          Text(iletilenArgumanlar.sifre),
        ]),
      ),
    );
  }
}

class VeriModeli {
  String kullaniciAdi, sifre;
  VeriModeli({required this.kullaniciAdi, required this.sifre});
}
