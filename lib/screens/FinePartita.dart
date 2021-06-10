import 'package:litorapp/screens/HomePage.dart';
import 'package:litorapp/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class FinePartita extends StatefulWidget {
  List<int> listaRisposte;
  String modalita;

  FinePartita({Key key, @required this.modalita, @required this.listaRisposte})
      : super(key: key);

  @override
  _FinePartitaState createState() => _FinePartitaState();
}

class _FinePartitaState extends State<FinePartita> {
  @override
  Widget build(BuildContext context) {
    if (widget.modalita == "Architettura" ||
        widget.modalita == "Natura") if (MyApp
            .listaTarget[4].numeratore <
        MyApp.listaTarget[4].denominatore) {
      MyApp.listaTarget[4].numeratore++;
      if (MyApp.listaTarget[4].numeratore == MyApp.listaTarget[4].denominatore)
        MyApp.listaTarget[4].isDone = true;
    }

    if (widget.modalita == "Pomezia" || widget.modalita == "Ostia") if (MyApp
            .listaTarget[2].numeratore <
        MyApp.listaTarget[2].denominatore) {
      MyApp.listaTarget[2].numeratore++;
      if (MyApp.listaTarget[2].numeratore == MyApp.listaTarget[2].denominatore)
        MyApp.listaTarget[2].isDone = true;
    }

    int esatte = 0;

    for (var risp in widget.listaRisposte) if (risp == 1) esatte++;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            FlatButton.icon(
                icon: Icon(Icons.stars, color: Colors.blue),
                label: Text(
                  MyApp.crediti.toString(),
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: null)
          ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Partita completata!",
            style: TextStyle(
                color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
          )),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
                "Hai totalizzato " +
                    (esatte * 100).toString() +
                    " punti rispondendo in modo corretto a " +
                    esatte.toString() +
                    "/5 domande!",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center),
          )),
          RaisedButton(
              color: Colors.blue[400],
              elevation: 4,
              child: Text(
                "OK",
                style: TextStyle(fontSize: 23, color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              onPressed: () => _navigateToNextScreen(context, "Home")),
        ],
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, String button) {
    switch (button) {
      case "Home":
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (Route<dynamic> route) => false);
        break;
    }
  }
}
