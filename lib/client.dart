class Client {
  String ime;
  String prezime;
  String telefon;

  Client({
    required this.ime,
    required this.prezime,
    required this.telefon,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      ime: json['ime'],
      prezime: json['prezime'],
      telefon: json['telefon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'ime': ime,
        'prezime': prezime,
        'telefon': telefon,
      };
}