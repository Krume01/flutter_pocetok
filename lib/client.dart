class Klient {
  int? id; // nullable бидејќи при додавање (POST) не се праќа
  String ime;
  String prezime;
  String telefon;

  Klient({
    this.id,
    required this.ime,
    required this.prezime,
    required this.telefon,
  });

  factory Klient.fromJson(Map<String, dynamic> json) {
    return Klient(
      id: json['id'], // важно за update и delete
      ime: json['ime'],
      prezime: json['prezime'],
      telefon: json['telefon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'ime': ime,
        'prezime': prezime,
        'telefon': telefon,
      };
}
