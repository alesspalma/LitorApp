class Target {
  int id;
  String descrizione;
  int valore;
  bool isDone;
  int numeratore;
  int denominatore;
  bool isRiscattato = false;

  Target({
    int,
    id,
    String descrizione,
    int valore,
    bool isDone,
    int numeratore,
    int denominatore,
  }) {
    this.id = id;
    this.descrizione = descrizione;
    this.valore = valore;
    this.isDone = isDone;
    this.numeratore = numeratore;
    this.denominatore = denominatore;
  }
}
