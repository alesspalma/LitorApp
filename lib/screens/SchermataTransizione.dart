import 'dart:async';
import 'dart:ui';
import 'package:litorapp/screens/Descrizione.dart';
import 'package:flutter/material.dart';
import 'package:litorapp/main.dart';

// ignore: must_be_immutable
class SchermataTransizione extends StatefulWidget {
  String destination;
  String image;

  SchermataTransizione(
      {Key key, @required this.destination, @required this.image})
      : super(key: key);

  @override
  _SchermataTransizioneState createState() => _SchermataTransizioneState();
}

class _SchermataTransizioneState extends State<SchermataTransizione> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1, milliseconds: 500),
        () => _navigateToNextScreen(context, "Gioca"));

    return Scaffold(
        appBar: AppBar(
            title: Text("LitorApp"),
            centerTitle: true,
            leading: Container(),
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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Iniziamo!",
              style: TextStyle(fontSize: 26),
            ),
            Padding(padding: EdgeInsets.only(top: 40)),
            widget.destination != "Classica"
                ? Container(
                    width: 200,
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0)),
                              child: Image.network(widget.image,
                                  height: 180, fit: BoxFit.fill),
                            ),
                            ListTile(
                              title: Text(widget.destination,
                                  style: TextStyle(fontSize: 18),
                                  textAlign: TextAlign.center),
                              dense: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Container(
                        child: Image.network(widget.image),
                        padding: EdgeInsets.only(
                            top: 30, bottom: 60, left: 22, right: 22)),
                  ),
          ],
        )));
  }

  void _navigateToNextScreen(BuildContext context, String button) {
    switch (button) {
      case "Gioca":
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => Descrizione(
                      modalita: widget.destination,
                      indice: 0,
                      listaRisposte: [],
                    )),
            (Route<dynamic> route) => false);
        break;
    }
  }
}
