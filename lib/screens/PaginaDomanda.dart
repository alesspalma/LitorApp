import 'dart:async';
import 'package:litorapp/models/BeneCulturale.dart';
import 'package:litorapp/screens/Curiosita.dart';
import 'package:litorapp/screens/Descrizione.dart';
import 'package:litorapp/screens/Spiegazione.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:litorapp/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaginaDomanda extends StatefulWidget {
  String modalita;
  int indice;
  Domanda domanda;
  List<int> listaRisposte;

  PaginaDomanda(
      {Key key,
      @required this.modalita,
      @required this.indice,
      @required this.domanda,
      @required this.listaRisposte})
      : super(key: key) {
    this.domanda.risposte.shuffle();
  }

  @override
  _PaginaDomandaState createState() => _PaginaDomandaState();
}

class _PaginaDomandaState extends State<PaginaDomanda> {
  var cardColors = [Colors.white, Colors.white, Colors.white, Colors.white];
  var cardBorders = [
    RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(10)),
    RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(10)),
    RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(10)),
    RoundedRectangleBorder(
        side: BorderSide(color: Colors.white, width: 1),
        borderRadius: BorderRadius.circular(10)),
  ];
  bool animationController = true;
  bool visibilityController = false;
  int rispostagiusta;

  bool answerController = true;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 4; i++)
      if (widget.domanda.risposte[i] == widget.domanda.corretta)
        rispostagiusta = i;

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
        Padding(padding: EdgeInsets.only(top: 10)),
        Container(
          width: 340,
          child: LinearPercentIndicator(
            lineHeight: 14.0,
            percent: 1,
            animation: animationController,
            animationDuration: 30000,
            onAnimationEnd: () => _timerDead(context),
            trailing: Icon(Icons.hourglass_bottom),
            backgroundColor: Colors.red,
            isRTL: true,
            progressColor: Colors.grey[350],
            linearStrokeCap: LinearStrokeCap.butt,
          ),
        ),
        if (!widget.domanda.isQuestionWithImage())
          Container(
            width: 380,
            constraints: BoxConstraints(minHeight: 150),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 8)),
                  Text(widget.domanda.nomeBene,
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: 15, right: 15, left: 15, top: 15),
                      child: Text(
                        widget.domanda.domanda,
                        style: new TextStyle(
                          fontSize: 17.0,
                        ),
                        textAlign: TextAlign.justify,
                      )),
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 4,
              margin: EdgeInsets.all(10),
            ),
          )
        else
          Container(
            width: 380,
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
                    height: 140,
                    child: Image.network(
                      widget.domanda.fotoDomanda,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: 5, right: 15, left: 15, top: 8),
                      child: Text(
                        widget.domanda.domanda,
                        style: new TextStyle(
                          fontSize: 17.0,
                        ),
                        textAlign: TextAlign.justify,
                      )),
                ],
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 4,
              margin: EdgeInsets.all(10),
            ),
          ),
        Padding(padding: EdgeInsets.only(top: 5)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (rispostagiusta != 0)
              Container(
                  width: 170,
                  height: 90,
                  child: Card(
                      shape: cardBorders[0],
                      color: cardColors[0],
                      elevation: 4,
                      child: InkWell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(widget.domanda.risposte[0],
                                style: new TextStyle(
                                  fontSize: 16.0,
                                ),
                                textAlign: TextAlign.center),
                          ),
                        ),
                        onTap: answerController == true
                            ? () => _navigateToNextScreen(
                                context,
                                widget.domanda.risposte[0],
                                widget.domanda.corretta,
                                0)
                            : null,
                      )))
            else
              _stacked(0),
            if (rispostagiusta != 1)
              Container(
                  width: 170,
                  height: 90,
                  child: Card(
                      shape: cardBorders[1],
                      color: cardColors[1],
                      elevation: 4,
                      child: InkWell(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(widget.domanda.risposte[1],
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center),
                        )),
                        onTap: answerController == true
                            ? () => _navigateToNextScreen(
                                context,
                                widget.domanda.risposte[1],
                                widget.domanda.corretta,
                                1)
                            : null,
                      )))
            else
              _stacked(1)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (rispostagiusta != 2)
              Container(
                  width: 170,
                  height: 90,
                  child: Card(
                      shape: cardBorders[2],
                      color: cardColors[2],
                      elevation: 4,
                      child: InkWell(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(widget.domanda.risposte[2],
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center),
                        )),
                        onTap: answerController == true
                            ? () => _navigateToNextScreen(
                                context,
                                widget.domanda.risposte[2],
                                widget.domanda.corretta,
                                2)
                            : null,
                      )))
            else
              _stacked(2),
            if (rispostagiusta != 3)
              Container(
                  width: 170,
                  height: 90,
                  child: Card(
                      shape: cardBorders[3],
                      color: cardColors[3],
                      elevation: 4,
                      child: InkWell(
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            widget.domanda.risposte[3],
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )),
                        onTap: answerController == true
                            ? () => _navigateToNextScreen(
                                context,
                                widget.domanda.risposte[3],
                                widget.domanda.corretta,
                                3)
                            : null,
                      )))
            else
              _stacked(3)
          ],
        ),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: Stack(children: [
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
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 2)),
        Text(
          "Domanda " + (widget.indice + 1).toString() + " di 5",
          style: TextStyle(fontSize: 16),
        ),
        Padding(padding: EdgeInsets.only(top: 11)),
      ]),
    );
  }

  Widget _stacked(int indice) {
    return Stack(children: [
      Container(
          width: 170,
          height: 90,
          child: Card(
              shape: cardBorders[indice],
              color: cardColors[indice],
              elevation: 4,
              child: InkWell(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(widget.domanda.risposte[indice],
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center),
                )),
                onTap: answerController == true
                    ? () => _navigateToNextScreen(
                        context,
                        widget.domanda.risposte[indice],
                        widget.domanda.corretta,
                        indice)
                    : null,
              ))),
      Visibility(
          visible: visibilityController,
          child: Padding(
            padding: const EdgeInsets.only(left: 102),
            child: Container(
              width: 68,
              height: 35,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                child: Center(
                    child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Text(
                        "+100",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ),
                    Icon(Icons.stars, color: Colors.white)
                  ],
                )),
              ),
            ),
          )),
    ]);
  }

  void _navigateToNextScreen(
      BuildContext context, String risposta, String corretta, int card) {
    if (risposta == corretta) {
      setState(() => {
            answerController = false,
            animationController = false,
            visibilityController = true,
            MyApp.crediti += 100,
            cardColors[card] = Colors.green,
            cardBorders[card] = RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(10)),
            widget.listaRisposte.add(1),
          });

      if (widget.domanda.localita == "Ostia Antica" ||
          widget.domanda.localita == "Lido di Ostia") if (MyApp
              .listaTarget[1].numeratore <
          MyApp.listaTarget[1].denominatore) {
        MyApp.listaTarget[1].numeratore++;
        if (MyApp.listaTarget[1].numeratore ==
            MyApp.listaTarget[1].denominatore)
          MyApp.listaTarget[1].isDone = true;
      }

      if (widget.domanda.categoria == "natura" &&
          MyApp.listaTarget[3].numeratore < MyApp.listaTarget[3].denominatore) {
        MyApp.listaTarget[3].numeratore++;
        if (MyApp.listaTarget[3].numeratore ==
            MyApp.listaTarget[3].denominatore)
          MyApp.listaTarget[3].isDone = true;
      }

      Timer(
          Duration(seconds: 2),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Curiosita(
                      modalita: widget.modalita,
                      indice: widget.indice + 1,
                      domanda: widget.domanda,
                      listaRisposte: widget.listaRisposte)),
              (Route<dynamic> route) => false));
    } else {
      setState(() => {
            answerController = false,
            animationController = false,
            cardColors[card] = Colors.red,
            cardBorders[card] = RoundedRectangleBorder(
                side: BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(10)),
            cardColors[rispostagiusta] = Colors.green,
            cardBorders[rispostagiusta] = RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 1),
                borderRadius: BorderRadius.circular(10)),
            widget.listaRisposte.add(0),
          });

      Timer(
          Duration(seconds: 2),
          () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => Spiegazione(
                      modalita: widget.modalita,
                      indice: widget.indice + 1,
                      domanda: widget.domanda,
                      listaRisposte: widget.listaRisposte)),
              (Route<dynamic> route) => false));
    }
  }

  void _timerDead(BuildContext context) {
    setState(() => {
          answerController = false,
          cardColors[rispostagiusta] = Colors.grey[400],
          cardBorders[rispostagiusta] = RoundedRectangleBorder(
              side: BorderSide(color: Colors.green, width: 4),
              borderRadius: BorderRadius.circular(10)),
          widget.listaRisposte.add(0),
        });

    Timer(
        Duration(seconds: 2),
        () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Spiegazione(
                    modalita: widget.modalita,
                    indice: widget.indice + 1,
                    domanda: widget.domanda,
                    listaRisposte: widget.listaRisposte)),
            (Route<dynamic> route) => false));
  }
}
