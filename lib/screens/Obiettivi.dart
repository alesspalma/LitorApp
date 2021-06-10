import 'package:flutter/material.dart';
import 'package:litorapp/models/Target.dart';
import 'package:litorapp/main.dart';
import 'package:litorapp/screens/ScegliCategoria.dart';
import 'package:litorapp/screens/ScegliZona.dart';
import 'package:litorapp/screens/SchermataTransizione.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class Obiettivi extends StatefulWidget {
  _ObiettiviState createState() => _ObiettiviState();
}

class _ObiettiviState extends State<Obiettivi> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<Target> _target = List<Target>.from(MyApp.listaTarget);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Obiettivi"),
            centerTitle: true,
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.stars, color: Colors.white),
                  color: Colors.blue,
                  label: Text(
                    MyApp.crediti.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => MyApp.showAlertDialog(context))
            ]),
        body: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Text("Scadono tra:", style: TextStyle(fontSize: 20))),
            SlideCountdownClock(
              duration: Duration(
                  hours: 24 - DateTime.now().hour,
                  minutes: 1440 - DateTime.now().minute,
                  seconds: 86400 - DateTime.now().second),
              separator: ":",
            ),
            Padding(padding: EdgeInsets.only(bottom: 20)),
            Expanded(
                child: AnimatedList(
                    key: _key,
                    initialItemCount: _target.length,
                    itemBuilder: (context, index, animation) {
                      if (_target[index].isRiscattato == false)
                        return _buildItem(_target[index], animation, index);
                      return SizedBox(width: 0, height: 0);
                    })),
          ],
        ));
  }

  Widget _buildItem(Target item, Animation animation, int index) {
    if (item.isDone) return _buildDoneTarget(item, animation, index);
    return _buildNotDoneTarget(item, animation, index);
  }

  void _removeItem(int i) {
    Target removedItem = _target.removeAt(i);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(removedItem, animation, i);
    };
    _key.currentState.removeItem(i, builder);
  }

  Widget _buildNotDoneTarget(Target item, Animation animation, int index) {
    return SizeTransition(
        sizeFactor: animation,
        child: Container(
            padding: EdgeInsets.only(bottom: 7),
            child: Card(
              color: Colors.white70,
              elevation: 4,
              child: ListTile(
                onTap: () {
                  _navigateToNextScreen(context, item);
                },
                title: Text(
                  item.descrizione,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                subtitle: Row(children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: item.numeratore / item.denominatore,
                      //backgroundColor: Colors.red,
                    ),
                  ),
                  Container(
                    child: Text(item.numeratore.toString() +
                        "/" +
                        item.denominatore.toString()),
                    padding: EdgeInsets.only(left: 5),
                  )
                ]),
                leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.stars),
                      Text("+" + item.valore.toString()),
                    ]),
                trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.arrow_forward_ios, color: Colors.blue),
                      Text("Vai!")
                    ]),
              ),
            )));
  }

  Widget _buildDoneTarget(Target item, Animation animation, int index) {
    return SizeTransition(
        sizeFactor: animation,
        child: Container(
            padding: EdgeInsets.only(bottom: 7),
            child: Card(
              color: Colors.green[300],
              elevation: 4,
              child: ListTile(
                  onTap: () {
                    for (int i = 0; i < MyApp.listaTarget.length; i++) {
                      if (MyApp.listaTarget[i].id == item.id)
                        MyApp.listaTarget[i].isRiscattato = true;
                    }
                    _removeItem(index);
                    setState(() {
                      MyApp.crediti += item.valore;
                    });
                    showCongratsDialog(context, item.valore);
                  },
                  title: Text(
                    item.descrizione,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text("TOCCA PER RISCUOTERE!"),
                  leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.stars,
                        ),
                        Text(
                          "+" + item.valore.toString(),
                        ),
                      ]),
                  trailing: Padding(
                    padding: EdgeInsets.only(right: 3),
                    child: Icon(Icons.done, color: Colors.green[700]),
                  )),
            )));
  }

  void showCongratsDialog(BuildContext context, int valore) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text(
        "OK",
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Complimenti",
        style: TextStyle(fontSize: 25),
      ),
      content: Text(
        "Hai guadagnato " +
            valore.toString() +
            " punti," +
            " ora ne hai " +
            MyApp.crediti.toString() +
            "!",
        style: TextStyle(fontSize: 20),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _navigateToNextScreen(BuildContext context, Target item) {
    switch (item.id) {
      case 1:
        {
          MyApp.listaDomandeOstia.shuffle();
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SchermataTransizione(
                  destination: "Ostia",
                  image:
                      'https://www.farodiroma.it/wp-content/uploads/2020/06/ITIN4.PONTILE-e1553962992210.jpg')));
        }
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ScegliZona()));
        break;
      case 3:
        {
          MyApp.listaDomandeNatura.shuffle();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => SchermataTransizione(
                      destination: "Natura",
                      image:
                          "https://www.facciounagita.it/wp-content/uploads/2018/12/anzio-e-le-grotte-di-nerone-2.jpg")),
              (Route<dynamic> route) => false);
        }
        break;
      case 4:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ScegliCategoria()));
        break;
    }
  }
}
