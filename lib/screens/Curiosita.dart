import 'package:litorapp/models/BeneCulturale.dart';
import 'package:litorapp/screens/Descrizione.dart';
import 'package:litorapp/screens/FinePartita.dart';
import 'package:litorapp/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Curiosita extends StatefulWidget {
  String modalita;
  int indice;
  Domanda domanda;
  List<int> listaRisposte;

  Curiosita(
      {Key key,
      @required this.modalita,
      @required this.indice,
      @required this.domanda,
      @required this.listaRisposte})
      : super(key: key);

  @override
  _CuriositaState createState() => _CuriositaState();
}

class _CuriositaState extends State<Curiosita> {
  @override
  Widget build(BuildContext context) {
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
                Text(widget.domanda.nomeBene,
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                Padding(padding: EdgeInsets.only(top: 8)),
                SizedBox(
                  width: 380,
                  height: 173,
                  child: Image.network(
                    widget.domanda.fotoCuriosita,
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
                    child:
                        Text("Curiosità", style: new TextStyle(fontSize: 19)),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13, right: 13),
                    child: Text(
                      widget.domanda.curiosita,
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
          "Domanda " + widget.indice.toString() + " di 5",
          style: TextStyle(fontSize: 16),
        )
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 62.0),
        child: FloatingActionButton(
          child: Icon(Icons.navigate_next),
          onPressed: () => {
            if (widget.indice != 5)
              _navigateToNextScreen(context, "Descrizione")
            else
              _navigateToNextScreen(context, "FinePartita")
          },
        ),
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, String button) {
    switch (button) {
      case "Descrizione":
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Descrizione(
                    modalita: widget.modalita,
                    indice: widget.indice,
                    listaRisposte: widget.listaRisposte)),
            (Route<dynamic> route) => false);
        break;

      case "FinePartita":
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => FinePartita(
                    modalita: widget.modalita,
                    listaRisposte: widget.listaRisposte)),
            (Route<dynamic> route) => false);
        break;
    }
  }
}
