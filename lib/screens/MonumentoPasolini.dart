import 'package:flutter/material.dart';
import 'package:litorapp/main.dart';
import 'package:carousel_pro/carousel_pro.dart';

class MonumentoPasolini extends StatefulWidget {
  @override
  _MonumentoPasoliniState createState() => _MonumentoPasoliniState();
}

class _MonumentoPasoliniState extends State<MonumentoPasolini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyApp.listaBeni[9].nome), centerTitle: true),
      body: Center(
        child: ListView(children: <Widget>[
          SizedBox(
              height: 150.0,
              width: double.infinity,
              child: Carousel(
                autoplay: false,
                dotSize: 5.0,
                dotColor: Colors.white,
                dotIncreasedColor: Colors.white,
                dotBgColor: Colors.transparent,
                indicatorBgPadding: 10.0,
                images: [
                  Image.network(
                    MyApp.listaBeni[9].foto[0],
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    MyApp.listaBeni[9].foto[1],
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    MyApp.listaBeni[9].foto[2],
                    fit: BoxFit.cover,
                  ),
                ],
              )),
          SizedBox(height: 20),
          Align(
            child: Container(
              width: 345,
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text("Informazioni",
                            style: new TextStyle(fontSize: 19)),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      RaisedButton(
                        onPressed: () {
                          MyApp.showAlertDialog(context);
                        },
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.place,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Padding(padding: EdgeInsets.only(left: 18)),
                            Flexible(
                              child: Column(children: <Widget>[
                                Text(
                                  MyApp.listaBeni[9].posizione.indirizzo +
                                      ". " +
                                      MyApp.listaBeni[9].posizione.cap +
                                      ". " +
                                      MyApp.listaBeni[9].posizione.localita +
                                      ", " +
                                      MyApp.listaBeni[9].posizione.provincia,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal),
                                  overflow: TextOverflow.visible,
                                )
                              ]),
                            ),
                            Icon(
                              Icons.navigate_next,
                              size: 40,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),
                      MyApp.listaBeni[9].contatti.telefono != null
                          ? Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 18)),
                                Icon(
                                  Icons.smartphone,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                                RaisedButton(
                                    child: Text(
                                      MyApp.listaBeni[9].contatti.telefono,
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 16,
                                      ),
                                    ),
                                    onPressed: () {
                                      MyApp.showAlertDialog(context);
                                    },
                                    elevation: 0,
                                    hoverElevation: 0,
                                    focusElevation: 0,
                                    highlightElevation: 0,
                                    color: Colors.transparent),
                                Padding(
                                  padding: EdgeInsets.only(left: 113),
                                  child: Icon(
                                    Icons.navigate_next,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      MyApp.listaBeni[9].contatti.mail != null
                          ? Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 18)),
                                Icon(
                                  Icons.email_outlined,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                                Flexible(
                                    child: RaisedButton(
                                        child: Column(children: <Widget>[
                                          Text(MyApp.listaBeni[9].contatti.mail,
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 16,
                                              ),
                                              overflow: TextOverflow.visible)
                                        ]),
                                        onPressed: () {
                                          MyApp.showAlertDialog(context);
                                        },
                                        elevation: 0,
                                        hoverElevation: 0,
                                        focusElevation: 0,
                                        highlightElevation: 0,
                                        color: Colors.transparent)),
                                Padding(
                                  padding: EdgeInsets.only(left: 45),
                                  child: Icon(
                                    Icons.navigate_next,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      MyApp.listaBeni[9].contatti.mail != null
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Padding(padding: EdgeInsets.only(left: 18)),
                                Icon(
                                  Icons.laptop,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                                Flexible(
                                    child: RaisedButton(
                                        child: Column(children: <Widget>[
                                          Text(
                                            MyApp
                                                .listaBeni[9].contatti.sito_web,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal),
                                            overflow: TextOverflow.visible,
                                          )
                                        ]),
                                        onPressed: () {
                                          MyApp.showAlertDialog(context);
                                        },
                                        elevation: 0,
                                        hoverElevation: 0,
                                        focusElevation: 0,
                                        highlightElevation: 0,
                                        color: Colors.transparent)),
                                Icon(
                                  Icons.navigate_next,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      MyApp.listaBeni[9].contatti.orari != null
                          ? Row(
                              children: [
                                Padding(padding: EdgeInsets.only(left: 18)),
                                Icon(
                                  Icons.access_time,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                                Flexible(
                                    child: Container(
                                        child: Column(children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: Text(
                                              MyApp.listaBeni[9].contatti.orari,
                                              style: TextStyle(fontSize: 16),
                                              overflow: TextOverflow.visible,
                                            ),
                                          )
                                        ]),
                                        color: Colors.transparent))
                              ],
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )),
            ),
          ),
          SizedBox(height: 20),
          Align(
            child: Container(
              width: 358,
              child: Card(
                child: new SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8),
                        child: Text("Descrizione",
                            style: new TextStyle(fontSize: 19)),
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 13, right: 13),
                        child: Text(
                          MyApp.listaBeni[9].info,
                          style: new TextStyle(
                            fontSize: 17.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 4,
                margin: EdgeInsets.all(10),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
