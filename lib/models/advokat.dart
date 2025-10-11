import 'package:json_annotation/json_annotation.dart';

part 'advokat.g.dart';

@JsonSerializable()
class Advokat {
  @JsonKey(name: 'Id')
  final int id;
  @JsonKey(name: 'Ime')
  final String ime;
  @JsonKey(name: 'Prezime')
  final String prezime;
  @JsonKey(name: 'Email')
  final String email;
  @JsonKey(name: 'PasswordHash')
  final String passwordhash;
  @JsonKey(name: 'PasswordSalt')
  final String passwordsalt; // или authToken ако користиш токен

  Advokat({
    required this.id,
    required this.ime,
    required this.prezime,
    required this.email,
    required this.passwordhash,
    required this.passwordsalt
  });

  factory Advokat.fromJson(Map<String, dynamic> json) => _$AdvokatFromJson(json);
  Map<String, dynamic> toJson() => _$AdvokatToJson(this);
}
