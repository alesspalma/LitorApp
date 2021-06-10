import 'dart:ui';

import 'package:litorapp/screens/SchermataTransizione.dart';
import 'package:flutter/material.dart';
import 'package:litorapp/main.dart';

class ScegliCategoria extends StatefulWidget {
  final String fotoNatura =
      "https://www.facciounagita.it/wp-content/uploads/2018/12/anzio-e-le-grotte-di-nerone-2.jpg";
  final String fotoArchitett =
      "https://www.reginapacisostia.it/wp-content/uploads/2018/12/cover-dvd-papa-retro.jpg";

  @override
  _ScegliCategoriaState createState() => _ScegliCategoriaState();
}

class _ScegliCategoriaState extends State<ScegliCategoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("LitorApp"), centerTitle: true, actions: <Widget>[
        FlatButton.icon(
            icon: Icon(Icons.stars, color: Colors.white),
            color: Colors.blue,
            label: Text(
              MyApp.crediti.toString(),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => MyApp.showAlertDialog(context))
      ]),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(50),
                  child: Text("Seleziona una categoria:",
                      style: TextStyle(fontSize: 23))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 170,
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
                          child: Image.network(widget.fotoArchitett,
                              height: 150, fit: BoxFit.fill),
                        ),
                        ListTile(
                          title: Text("Architettura",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center),
                          dense: true,
                        ),
                      ],
                    ),
                    onTap: () => _navigateToNextScreen(context, "Architettura"),
                  ),
                ),
              ),
              Container(
                width: 170,
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
                          child: Image.network(widget.fotoNatura,
                              height: 150, fit: BoxFit.fill),
                        ),
                        ListTile(
                          title: Text("Natura",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center),
                          dense: true,
                        ),
                      ],
                    ),
                    onTap: () => _navigateToNextScreen(context, "Natura"),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                foregroundDecoration: BoxDecoration(
                  color: Colors.grey,
                  backgroundBlendMode: BlendMode.saturation,
                ),
                width: 170,
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
                          child: Image.network(
                              "https://pbs.twimg.com/media/Egfon6OUYAAy0ng.jpg",
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        ListTile(
                          title: Text("...",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center),
                          dense: true,
                        ),
                      ],
                    ),
                    onTap: () => MyApp.showAlertDialog(context),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToNextScreen(BuildContext context, String button) {
    switch (button) {
      case "Natura":
        {
          MyApp.listaDomandeNatura.shuffle();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => SchermataTransizione(
                      destination: "Natura", image: widget.fotoNatura)),
              (Route<dynamic> route) => false);
        }
        break;
      case "Architettura":
        {
          MyApp.listaDomandeArchitett.shuffle();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => SchermataTransizione(
                      destination: "Architettura",
                      image: widget.fotoArchitett)),
              (Route<dynamic> route) => false);
        }
        break;
    }
  }
}
