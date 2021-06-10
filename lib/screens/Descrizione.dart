import 'dart:ui';
import 'package:litorapp/screens/PaginaDomanda.dart';
import 'package:litorapp/models/BeneCulturale.dart';
import 'package:litorapp/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Descrizione extends StatefulWidget {
  String modalita;
  int indice;
  List<int> listaRisposte;

  Descrizione(
      {Key key,
      @required this.modalita,
      @required this.indice,
      @required this.listaRisposte})
      : super(key: key);

  @override
  _DescrizioneState createState() => _DescrizioneState();

  static Widget progressBar(double value, Color colore) {
    return Container(
      width: 340,
      height: 20,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: LinearProgressIndicator(
          value: value,
          valueColor: AlwaysStoppedAnimation<Color>(colore),
          backgroundColor: Colors.transparent,
        ),
      ),
    );
  }

  // ignore: missing_return
  static Color getColor(List<int> listaRisposte, int domanda) {
    if (listaRisposte.length < domanda)
      return Colors.grey[350];
    else if (listaRisposte[domanda - 1] == 0)
      return Colors.red;
    else if (listaRisposte[domanda - 1] == 1) return Colors.green;
  }
}

class _DescrizioneState extends State<Descrizione> {
  @override
  Widget build(BuildContext context) {
    List<Domanda> domande;

    if (widget.modalita == "Classica")
      domande = MyApp.listaTutteDomande;
    else if (widget.modalita == "Ostia")
      domande = MyApp.listaDomandeOstia;
    else if (widget.modalita == "Pomezia")
      domande = MyApp.listaDomandePomezia;
    else if (widget.modalita == "Architettura")
      domande = MyApp.listaDomandeArchitett;
    else if (widget.modalita == "Natura") domande = MyApp.listaDomandeNatura;

    return Scaffold(
      appBar: AppBar(
          title: Text(widget.modalita),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () => MyApp.showExitDialog(context),
          ),
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(
                Icons.stars,
                color: Colors.white,
              ),
              color: Colors.blue,
              label: Text(
                MyApp.crediti.toString(),
                style: TextStyle(color: Colors.white),
              ),
              onPressed: null,
            ),
          ]),
      body: Column(children: [
        Container(
          width: 380,
          height: 231,
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 8)),
                Text(domande[widget.indice].nomeBene,
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.only(top: 8)),
                SizedBox(
                  width: 380,
                  height: 173,
                  child: Image.network(
                    domande[widget.indice].fotoDescrizione,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 4,
            margin: EdgeInsets.all(10),
          ),
        ),
        Container(
          width: 380,
          height: 290,
          child: Card(
            child: new SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text("Introduzione",
                        style: new TextStyle(fontSize: 19)),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13, right: 13),
                    child: Text(
                      domande[widget.indice].descrizione,
                      style: new TextStyle(
                        fontSize: 17.0,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            elevation: 4,
            margin: EdgeInsets.all(10),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10)),
        Stack(children: [
          Descrizione.progressBar(
              5 / 5, Descrizione.getColor(widget.listaRisposte, 5)),
          Descrizione.progressBar(
              4 / 5, Descrizione.getColor(widget.listaRisposte, 4)),
          Descrizione.progressBar(
              3 / 5, Descrizione.getColor(widget.listaRisposte, 3)),
          Descrizione.progressBar(
              2 / 5, Descrizione.getColor(widget.listaRisposte, 2)),
          Descrizione.progressBar(
              1 / 5, Descrizione.getColor(widget.listaRisposte, 1))
        ]),
        Padding(padding: EdgeInsets.only(top: 2)),
        Text(
          "Domanda " + (widget.indice + 1).toString() + " di 5",
          style: TextStyle(fontSize: 16),
        )
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 62.0),
        child: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () => _navigateToNextScreen(context, "Domanda",
              domanda: domande[widget.indice]),
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, String button,
      {Domanda domanda}) {
    switch (button) {
      case "Domanda":
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => PaginaDomanda(
                    modalita: widget.modalita,
                    indice: widget.indice,
                    domanda: domanda,
                    listaRisposte: widget.listaRisposte)),
            (Route<dynamic> route) => false);
        break;
    }
  }
}
