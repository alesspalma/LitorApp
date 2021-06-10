import 'dart:ui';

import 'package:litorapp/screens/SchermataTransizione.dart';
import 'package:flutter/material.dart';
import 'package:litorapp/main.dart';

class ScegliZona extends StatefulWidget {
  final String fotoOstia =
      'https://www.farodiroma.it/wp-content/uploads/2020/06/ITIN4.PONTILE-e1553962992210.jpg';
  final String fotoPomezia =
      'https://www.casilinanews.it/wp-content/uploads/2017/11/servizio-civico-comunale-pomezia.jpg';

  @override
  _ScegliZonaState createState() => _ScegliZonaState();
}

class _ScegliZonaState extends State<ScegliZona> {
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
                  child: Text("Seleziona una zona:",
                      style: TextStyle(fontSize: 26))),
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
                          child: Image.network(widget.fotoOstia,
                              height: 150, fit: BoxFit.fill),
                        ),
                        ListTile(
                          title: Text("Ostia",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center),
                          dense: true,
                        ),
                      ],
                    ),
                    onTap: () => _navigateToNextScreen(context, "Ostia"),
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
                          child: Image.network(widget.fotoPomezia,
                              height: 150, fit: BoxFit.fill),
                        ),
                        ListTile(
                          title: Text("Pomezia",
                              style: TextStyle(fontSize: 18),
                              textAlign: TextAlign.center),
                          dense: true,
                        ),
                      ],
                    ),
                    onTap: () => _navigateToNextScreen(context, "Pomezia"),
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
                              'https://i2.wp.com/www.latina24ore.it/wp-content/uploads/2018/01/comune-latina-foto-drone-2017.jpg?fit=996%2C686&ssl=1',
                              height: 150,
                              fit: BoxFit.fill),
                        ),
                        ListTile(
                          title: Text(
                            "...",
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
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
      case "Ostia":
        {
          MyApp.listaDomandeOstia.shuffle();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SchermataTransizione(
                  destination: "Ostia", image: widget.fotoOstia)));
        }
        break;
      case "Pomezia":
        {
          MyApp.listaDomandePomezia.shuffle();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SchermataTransizione(
                  destination: "Pomezia", image: widget.fotoPomezia)));
        }
        break;
    }
  }
}
