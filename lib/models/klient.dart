import 'package:json_annotation/json_annotation.dart';

part 'klient.g.dart';

@JsonSerializable()
class Klient {
  String? ime;
  String? prezime;
  String? adresa;
  String? telefon;
  int? id;

  Klient({
    this.ime,//ako sakas pole da e zadolzitelno moze da go napravis required this.tuzitel
    this.prezime,
    this.adresa,
    this.telefon,
    this.id
  });

  factory Klient.fromJson(Map<String, dynamic> json) => _$KlientFromJson(json);
  Map<String, dynamic> toJson() => _$KlientToJson(this);
}