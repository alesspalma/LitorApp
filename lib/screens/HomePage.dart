import 'package:flutter/material.dart';
import 'package:litorapp/screens/Archivio.dart';
import 'package:litorapp/screens/Gioca.dart';
import 'package:litorapp/screens/Obiettivi.dart';
import 'package:litorapp/main.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                  onPressed: () => MyApp.showAlertDialog(context))
            ]),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
          Container(
              child: Image.asset("contents/images/logo.png"),
              padding: EdgeInsets.only(bottom: 70, left: 40, right: 40)),
          Container(
              padding: EdgeInsets.only(bottom: 35, top: 20),
              child: ButtonTheme(
                  minWidth: 240.0,
                  height: 70.0,
                  child: RaisedButton(
                      onPressed: () =>
                          {_navigateToNextScreen(context, "GIOCA")},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.add_circle_outline,
                                size: 30, color: Colors.white),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Text('GIOCA',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            Padding(padding: EdgeInsets.only(left: 39)),
                            Icon(Icons.arrow_forward_ios, color: Colors.white)
                          ])))),
          Container(
              padding: EdgeInsets.only(bottom: 35),
              child: ButtonTheme(
                  minWidth: 240.0,
                  height: 70.0,
                  child: RaisedButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Obiettivi()),
                          ).then((value) => setState(() {})),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.emoji_events_outlined,
                                size: 30, color: Colors.white),
                            Padding(padding: EdgeInsets.only(right: 14)),
                            Text('OBIETTIVI',
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                            Padding(padding: EdgeInsets.only(left: 14)),
                            Icon(Icons.arrow_forward_ios, color: Colors.white)
                          ])))),
          ButtonTheme(
              minWidth: 240.0,
              height: 70.0,
              child: RaisedButton(
                  onPressed: () => {_navigateToNextScreen(context, "ARCHIVIO")},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Icon(Icons.account_balance_outlined,
                        size: 30, color: Colors.white),
                    Padding(padding: EdgeInsets.only(right: 14)),
                    Text('ARCHIVIO',
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                    Padding(padding: EdgeInsets.only(left: 18)),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ]))),
        ])));
  }
}

void _navigateToNextScreen(BuildContext context, String button) {
  switch (button) {
    case "GIOCA":
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Gioca()));
      break;
    case "ARCHIVIO":
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Archivio()));
      break;
  }
}
