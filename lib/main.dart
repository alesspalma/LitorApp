import 'package:flutter/material.dart';
import 'package:litorapp/models/Target.dart';
import 'package:litorapp/screens/HomePage.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:litorapp/models/BeneCulturale.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static List<Target> listaTarget = [
    Target(
      id: 0,
      descrizione: "Accedi all'app per 5 giorni consecutivi",
      valore: 100,
      isDone: true,
    ),
    Target(
        id: 1,
        descrizione: "Rispondi correttamente a 10 domande su Ostia",
        valore: 150,
        isDone: false,
        numeratore: 0,
        denominatore: 10),
    Target(
        id: 2,
        descrizione: "Svolgi 3 partite in modalità zona",
        valore: 100,
        isDone: false,
        numeratore: 0,
        denominatore: 3),
    Target(
        id: 3,
        descrizione: "Rispondi correttamente a 10 domande su Natura",
        valore: 150,
        isDone: false,
        numeratore: 0,
        denominatore: 10),
    Target(
        id: 4,
        descrizione: "Svolgi 3 partite in modalità categoria",
        valore: 100,
        isDone: false,
        numeratore: 0,
        denominatore: 3),
  ];

  final List<String> listaPaths = [
    "contents/json/antro_fauno.json",
    "contents/json/borgo_ostia_antica.json",
    "contents/json/borgo_pratica_di_mare.json",
    "contents/json/castello_giulio_II.json",
    "contents/json/castello_odescalchi.json",
    "contents/json/castello_santa_severa.json",
    "contents/json/chiesa_regina_pacis.json",
    "contents/json/chiesa_santa_maria_delle_vigne.json",
    "contents/json/grotte_nerone.json",
    "contents/json/monumento_pasolini.json",
    "contents/json/museo_lavinium.json",
    "contents/json/museo_novecento.json",
    "contents/json/oasi_lipu.json",
    "contents/json/parco_archeologico.json",
    "contents/json/parco_nazionale_circeo.json",
    "contents/json/pineta_castel_fusano.json",
    "contents/json/pontile.json",
    "contents/json/secche_tor_paterno.json",
    "contents/json/torre_astura.json",
    "contents/json/villa_romana.json"
  ];

  static List<BeneCulturale> listaBeni = [];

  static List<Domanda> listaTutteDomande = [];
  static List<Domanda> listaDomandePomezia = [];
  static List<Domanda> listaDomandeOstia = [];
  static List<Domanda> listaDomandeNatura = [];
  static List<Domanda> listaDomandeArchitett = [];
  static int crediti = 0;

  void loadAsset() async {
    for (var file in listaPaths) {
      Map<String, dynamic> data = jsonDecode(await rootBundle.loadString(file));
      var bene = BeneCulturale.fromJson(data);
      listaBeni.add(bene);
      listaTutteDomande.add(bene.domanda);

      if (bene.usatoPer == "Architettura")
        listaDomandeArchitett.add(bene.domanda);
      if (bene.usatoPer == "Natura") listaDomandeNatura.add(bene.domanda);
      if (bene.usatoPer == "Pomezia") listaDomandePomezia.add(bene.domanda);
      if (bene.usatoPer == "Ostia") listaDomandeOstia.add(bene.domanda);
    }
  }

  MyApp({Key key}) : super(key: key) {
    loadAsset();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "LitorApp",
        theme: ThemeData(primarySwatch: Colors.blue),
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }

  static void showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "OK",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Attenzione",
        style: TextStyle(fontSize: 25),
      ),
      content: Text(
        "Funzionalità non implementata!",
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static void showExitDialog(BuildContext context) {
    // set up the button
    Widget yesButton = FlatButton(
      child: Text(
        "ABBANDONA",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (Route<dynamic> route) => false),
    );

    Widget noButton = FlatButton(
      child: Text(
        "CONTINUA",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Attenzione",
        style: TextStyle(fontSize: 25),
      ),
      content: Text(
        "Sei sicuro di voler abbandonare la partita?",
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        noButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
