import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:litorapp/main.dart';

class Lipu extends StatefulWidget {
  @override
  _LipuState createState() => _LipuState();
}

class _LipuState extends State<Lipu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyApp.listaBeni[12].nome), centerTitle: true),
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
                    MyApp.listaBeni[12].foto[0],
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    MyApp.listaBeni[12].foto[1],
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    MyApp.listaBeni[12].foto[2],
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
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        onPressed: () {
                          MyApp.showAlertDialog(context);
                        },
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
                                  MyApp.listaBeni[12].posizione.indirizzo +
                                      ". " +
                                      MyApp.listaBeni[12].posizione.cap +
                                      ". " +
                                      MyApp.listaBeni[12].posizione.localita +
                                      ", " +
                                      MyApp.listaBeni[12].posizione.provincia,
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
                      Divider(thickness: 2),
                      MyApp.listaBeni[12].contatti.telefono != null
                          ? RaisedButton(
                              onPressed: () {
                                MyApp.showAlertDialog(context);
                              },
                              elevation: 0,
                              hoverElevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.smartphone,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 18)),
                                  Text(
                                    MyApp.listaBeni[12].contatti.telefono,
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 113),
                                    child: Icon(
                                      Icons.navigate_next,
                                      size: 40,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ))
                          : SizedBox(
                              height: 0,
                            ),
                      Divider(thickness: 2),
                      MyApp.listaBeni[12].contatti.mail != null
                          ? RaisedButton(
                              onPressed: () {
                                MyApp.showAlertDialog(context);
                              },
                              elevation: 0,
                              hoverElevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              color: Colors.transparent,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 18)),
                                  Flexible(
                                    child: Column(children: <Widget>[
                                      Text(MyApp.listaBeni[12].contatti.mail,
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.visible)
                                    ]),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 83),
                                    child: Icon(
                                      Icons.navigate_next,
                                      size: 40,
                                      color: Colors.blue,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      Divider(thickness: 2),
                      MyApp.listaBeni[12].contatti.mail != null
                          ? RaisedButton(
                              onPressed: () {
                                MyApp.showAlertDialog(context);
                              },
                              elevation: 0,
                              hoverElevation: 0,
                              focusElevation: 0,
                              highlightElevation: 0,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.laptop,
                                    size: 40,
                                    color: Colors.blue,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 18)),
                                  Flexible(
                                    child: Column(children: <Widget>[
                                      Text(
                                        MyApp.listaBeni[12].contatti.sito_web,
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
                            )
                          : SizedBox(
                              height: 0,
                            ),
                      Divider(thickness: 2),
                      MyApp.listaBeni[12].contatti.orari != null
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
                                              MyApp
                                                  .listaBeni[12].contatti.orari,
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
                          MyApp.listaBeni[12].info,
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
