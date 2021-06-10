import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:flutter/services.dart';
import 'package:litorapp/models/BeneCulturale.dart';
import 'package:litorapp/screens/BorgoOstiaAntica.dart';
import 'package:litorapp/screens/MonumentoPasolini.dart';
import 'Lipu.dart';
import 'package:litorapp/main.dart';
import 'AntroFauno.dart';
import 'BorgoPraticaDiMare.dart';
import 'CastelloGiulioII.dart';
import 'CastelloOdescalchi.dart';
import 'CastelloSantaSevera.dart';
import 'ChiesaReginaPacis.dart';
import 'ChiesaSantaMariaDelleVigne.dart';
import 'GrotteDiNerone.dart';
import 'MonumentoPasolini.dart';
import 'MuseoLavinium.dart';
import 'MuseoDelNovecento.dart';
import 'ParcoArcheologico.dart';
import 'ParcoNazionaleCirceo.dart';
import 'PinetaCastelFusano.dart';
import 'Pontile.dart';
import 'SeccheTorPaterno.dart';
import 'TorreAstura.dart';
import 'VillaRomana.dart';

void naviga(BuildContext context, String nome) {
  if (nome == MyApp.listaBeni[0].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AntroDelFauno()));
  } else if (nome == MyApp.listaBeni[1].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BorgoOstiaAntica()));
  } else if (nome == MyApp.listaBeni[2].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => BorgoPraticaDiMare()));
  } else if (nome == MyApp.listaBeni[3].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CastelloGiulioII()));
  } else if (nome == MyApp.listaBeni[4].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CastelloOdescalchi()));
  } else if (nome == MyApp.listaBeni[5].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CastelloSantaSevera()));
  } else if (nome == MyApp.listaBeni[6].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ChiesaReginaPacis()));
  } else if (nome == MyApp.listaBeni[7].nome) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ChiesaSantaMariaDelleVigne()));
  } else if (nome == MyApp.listaBeni[8].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => GrotteDiNerone()));
  } else if (nome == MyApp.listaBeni[9].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MonumentoPasolini()));
  } else if (nome == MyApp.listaBeni[10].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MuseoLavinium()));
  } else if (nome == MyApp.listaBeni[11].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MuseoDelNovecento()));
  } else if (nome == MyApp.listaBeni[12].nome) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Lipu()));
  } else if (nome == MyApp.listaBeni[13].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ParcoArcheologico()));
  } else if (nome == MyApp.listaBeni[14].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ParcoNazionaleCirceo()));
  } else if (nome == MyApp.listaBeni[15].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => PinetaCastelFusano()));
  } else if (nome == MyApp.listaBeni[16].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Pontile()));
  } else if (nome == MyApp.listaBeni[17].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SeccheTorPaterno()));
  } else if (nome == MyApp.listaBeni[18].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => TorreAstura()));
  } else if (nome == MyApp.listaBeni[19].nome) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VillaRomana()));
  } else {}
}

class Archivio extends StatefulWidget {
  Archivio() : super();
  ArchivioState createState() => ArchivioState();
}

class Zona {
  String nomeZona;
  //costruttore
  Zona(this.nomeZona);
  static List<Zona> getZona() {
    return <Zona>[
      Zona("Tutte le zone"),
      Zona("Pomezia"),
      Zona("Lido di Ostia"),
      Zona("Santa Marinella"),
      Zona("Ostia Antica"),
      Zona("Anzio"),
      Zona("San Felice Circeo"),
      Zona("Roma"),
      Zona("Nettuno"),
      Zona("Torvaianica"),
    ];
  }
}

class Categoria {
  String nomeCategoria;
  //costruttore
  Categoria(this.nomeCategoria);
  static List<Categoria> getCategoria() {
    return <Categoria>[
      Categoria("Tutte le categorie"),
      Categoria("archeologia"),
      Categoria("architettura"),
      Categoria("natura"),
      Categoria("cinema/teatro/fotografia"),
    ];
  }
}

class ArchivioState extends State<Archivio> {
  List<Zona> _zone = Zona.getZona();
  List<DropdownMenuItem<Zona>> _dropdownMenuItems;
  Zona _zonaSelezionata;

  List<Categoria> _categorie = Categoria.getCategoria();
  List<DropdownMenuItem<Categoria>> _dropdownMenuItems2;
  Categoria _categoriaSelezionata;

  TextEditingController controller = TextEditingController();

  @mustCallSuper
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItems(_zone);
    _zonaSelezionata = _dropdownMenuItems[0].value;

    _dropdownMenuItems2 = buildDropdownMenuItems2(_categorie);
    _categoriaSelezionata = _dropdownMenuItems2[0].value;

    KeyboardVisibilityNotification().addNewListener(
    onChange: (bool visible) {
      SystemChrome.restoreSystemUIOverlays();
    },
  );
  }

  List<DropdownMenuItem<Zona>> buildDropdownMenuItems(List zone) {
    List<DropdownMenuItem<Zona>> items = List();
    for (Zona zona in zone) {
      items.add(
        DropdownMenuItem(
          value: zona,
          child: Text(zona.nomeZona),
        ),
      );
    }

    return items;
  }

  List<DropdownMenuItem<Categoria>> buildDropdownMenuItems2(List categorie) {
    List<DropdownMenuItem<Categoria>> items = List();
    for (Categoria categoria in categorie) {
      items.add(
        DropdownMenuItem(
          value: categoria,
          child: Text(categoria.nomeCategoria),
        ),
      );
    }

    return items;
  }

  onChangeDropdownItem(Zona zonaSelezionata) {
    setState(() {
      _zonaSelezionata = zonaSelezionata;
    });
  }

  onChangeDropdownItem2(Categoria categoriaSelezionata) {
    setState(() {
      _categoriaSelezionata = categoriaSelezionata;
    });
  }

  List<BeneCulturale> _searchResult = [];

  TextEditingController editingController = TextEditingController();
  onSearchTextChanged(String text) async {
    text = text.toLowerCase();
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    MyApp.listaBeni.forEach((bene) {
      if (bene.nome.toLowerCase().contains(text)) _searchResult.add(bene);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Archivio"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20.0),
            Text("Filtra la tua ricerca per:", style: TextStyle(fontSize: 17)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      height: 55,
                      child: DropdownButton(
                          value: _zonaSelezionata,
                          items: _dropdownMenuItems,
                          onChanged: onChangeDropdownItem),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                        width: 150,
                        height: 55,
                        child: DropdownButton(
                            isExpanded: true,
                            value: _categoriaSelezionata,
                            items: _dropdownMenuItems2,
                            onChanged: onChangeDropdownItem2))
                  ],
                ),
              ],
            ),
            ListTile(
              title: new TextField(
                controller: controller,
                decoration: new InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  icon: Icon(Icons.search, color: Colors.blue),
                  hintText: 'Ricerca il nome del bene',
                  suffixIcon: IconButton(
                    icon: new Icon(
                      Icons.cancel,
                      color: Colors.blue,
                      size: 20,
                    ),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                    
                  ),
                ),
                onChanged: onSearchTextChanged,
              ),
            ),
            new Expanded(
              child: _searchResult.length != 0 || controller.text.isNotEmpty
                  ? new ListView.builder(
                      itemCount: _searchResult.length,
                      itemBuilder: (context, i) {
                        return new Column(
                          children: <Widget>[
                            (_zonaSelezionata.nomeZona ==
                                            _searchResult[i]
                                                .posizione
                                                .localita ||
                                        _zonaSelezionata.nomeZona ==
                                            "Tutte le zone") &&
                                    (_categoriaSelezionata.nomeCategoria ==
                                            _searchResult[i].categoria ||
                                        _categoriaSelezionata.nomeCategoria ==
                                            "Tutte le categorie")
                                ? Container(
                                    width: 375,
                                    margin: EdgeInsets.all(8.0),
                                    child: Card(
                                      elevation: 8,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0))),
                                      child: InkWell(
                                        onTap: () {
                                          naviga(
                                              context, _searchResult[i].nome);
                                        },
                                        child: Column(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                              child: Image.network(
                                                  _searchResult[i].foto[0],
                                                  width: 375,
                                                  height: 150,
                                                  fit: BoxFit.fill),
                                            ),
                                            Text(
                                              _searchResult[i].nome +
                                                  "  -   " +
                                                  _searchResult[i]
                                                      .posizione
                                                      .localita,
                                              style: TextStyle(fontSize: 18),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: MyApp.listaBeni.length,
                      itemBuilder: (BuildContext context, int i) => Column(
                        children: <Widget>[
                          (_zonaSelezionata.nomeZona ==
                                          MyApp.listaBeni[i].posizione
                                              .localita ||
                                      _zonaSelezionata.nomeZona ==
                                          "Tutte le zone") &&
                                  (_categoriaSelezionata.nomeCategoria ==
                                          MyApp.listaBeni[i].categoria ||
                                      _categoriaSelezionata.nomeCategoria ==
                                          "Tutte le categorie")
                              ? Container(
                                  width: 375,
                                  margin: EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    child: InkWell(
                                      onTap: () {
                                        naviga(
                                            context, MyApp.listaBeni[i].nome);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                            child: Image.network(
                                                MyApp.listaBeni[i].foto[0],
                                                width: 375,
                                                height: 150,
                                                fit: BoxFit.fill),
                                          ),
                                          Text(
                                            MyApp.listaBeni[i].nome +
                                                "  -  " +
                                                MyApp.listaBeni[i].posizione
                                                    .localita,
                                            style: TextStyle(fontSize: 18),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(height: 0)
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
