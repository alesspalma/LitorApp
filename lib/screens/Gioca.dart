import 'package:flutter/material.dart';
import 'package:litorapp/main.dart';
import 'package:litorapp/screens/ScegliCategoria.dart';
import 'package:litorapp/screens/ScegliZona.dart';
import 'package:litorapp/screens/SchermataTransizione.dart';

class Gioca extends StatelessWidget {
  final String testoInf =
      "Questo è un quiz game sui beni culturali del litorale romano. Scegli una modalità di gioco e prima di ogni domanda ti verrà mostrata una descrizione per aiutarti a rispondere correttamente e dopo aver risposto comparirà una spiegazione o una curiosità sull'argomento.\nBuon divertimento!";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Litorapp"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.info),
                  onPressed: () => {_showInformationDialog(context)})
            ]),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
          Container(
              child: Text("   Seleziona una\nmodalità di gioco:",
                  style: TextStyle(fontSize: 30)),
              margin: EdgeInsets.only(bottom: 75, left: 15, right: 15)),
          Container(
              padding: EdgeInsets.only(bottom: 35),
              child: ButtonTheme(
                  minWidth: 270.0,
                  height: 70.0,
                  child: RaisedButton(
                      onPressed: () =>
                          {_navigateToNextScreen(context, "CLASSICA")},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.contact_support_outlined,
                                size: 30, color: Colors.white),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text('CLASSICA',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            Padding(padding: EdgeInsets.only(left: 27)),
                            Icon(Icons.arrow_forward_ios, color: Colors.white)
                          ])))),
          Container(
              padding: EdgeInsets.only(bottom: 35),
              child: ButtonTheme(
                  minWidth: 270.0,
                  height: 70.0,
                  child: RaisedButton(
                      onPressed: () => {_navigateToNextScreen(context, "ZONA")},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.not_listed_location_outlined,
                                size: 30, color: Colors.white),
                            Padding(padding: EdgeInsets.only(left: 28)),
                            Text('PER ZONA',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            Padding(padding: EdgeInsets.only(left: 28)),
                            Icon(Icons.arrow_forward_ios, color: Colors.white)
                          ])))),
          ButtonTheme(
              minWidth: 270.0,
              height: 70.0,
              child: RaisedButton(
                  onPressed: () =>
                      {_navigateToNextScreen(context, "CATEGORIA")},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(Icons.fact_check_outlined,
                        size: 30, color: Colors.white),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Text('       PER\nCATEGORIA',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    Padding(padding: EdgeInsets.only(left: 20)),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ]))),
        ])));
  }

  void _showInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.all(10),
            child: Stack(
                overflow: Overflow.visible,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 440,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Benvenuto!",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.right,
                                )
                              ]),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                          ),
                          Text(testoInf,
                              style: TextStyle(fontSize: 23),
                              textAlign: TextAlign.left)
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 330, left: 240),
                      child: FlatButton(
                        child: Text("OK",
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ))
                ]));
      },
    );
  }

  void _navigateToNextScreen(BuildContext context, String button) {
    switch (button) {
      case "CLASSICA":
        {
          MyApp.listaTutteDomande.shuffle();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SchermataTransizione(
                  destination: "Classica",
                  image: "https://i.imgur.com/UBwFz7Q.png%22")));
        }
        break;
      case "ZONA":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ScegliZona()));
        break;
      case "CATEGORIA":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ScegliCategoria()));
        break;
    }
  }
}
