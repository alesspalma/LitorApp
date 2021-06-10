class Posizione {
  String indirizzo;
  String cap;
  String localita;
  String provincia;

  Posizione(this.indirizzo, this.cap, this.localita, this.provincia);
}

class Contatti {
  String telefono;
  String mail;
  String orari;
  // ignore: non_constant_identifier_names
  String sito_web;

  Contatti(this.telefono, this.mail, this.orari, this.sito_web);
}

class Domanda {
  String nomeBene;
  String categoria;
  String localita;
  String descrizione;
  String domanda;
  List<String> risposte;
  String corretta;
  String curiosita;
  String spiegazione;
  String fotoDescrizione;
  String fotoDomanda;
  String fotoCuriosita;
  String fotoSpiegazione;

  Domanda(
      this.nomeBene,
      this.descrizione,
      this.domanda,
      this.risposte,
      this.corretta,
      this.curiosita,
      this.spiegazione,
      this.fotoDescrizione,
      this.fotoDomanda,
      this.fotoCuriosita,
      this.fotoSpiegazione,
      this.categoria,
      this.localita);

  bool isQuestionWithImage() {
    return fotoDomanda != null;
  }
}

class BeneCulturale {
  String nome;
  String categoria;
  String usatoPer; //per dividere in liste in main.dart
  Posizione posizione;
  Contatti contatti;
  String info;
  List<String> foto;
  Domanda domanda;

  BeneCulturale.fromJson(Map<String, dynamic> json) {
    this.nome = json["nome"];

    this.categoria = json["categoria"];

    this.usatoPer = json["usatoPer"];

    this.posizione = Posizione(
        json["posizione"]["indirizzo"],
        json["posizione"]["cap"],
        json["posizione"]["localita"],
        json["posizione"]["provincia"]);

    this.contatti = Contatti(
        json["contatti"]["telefono"],
        json["contatti"]["mail"],
        json["contatti"]["orari"],
        json["contatti"]["sito_web"]);

    this.info = json["info"];

    this.foto = List<String>.from(json["foto"]);

    this.domanda = Domanda(
        json["nome"],
        json["domande"][0]["descrizione"],
        json["domande"][0]["domanda"],
        List<String>.from(json["domande"][0]["risposte"]),
        List<String>.from(json["domande"][0]["risposte"])[0],
        json["domande"][0]["curiosita"],
        json["domande"][0]["spiegazione"],
        json["domande"][0]["foto"]["descrizione"],
        json["domande"][0]["foto"]["domanda"],
        json["domande"][0]["foto"]["curiosita"],
        json["domande"][0]["foto"]["spiegazione"],
        json["categoria"],
        json["posizione"]["localita"]);
  }
}
