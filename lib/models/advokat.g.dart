// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advokat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Advokat _$AdvokatFromJson(Map<String, dynamic> json) => Advokat(
  id: (json['Id'] as num).toInt(),
  ime: json['Ime'] as String,
  prezime: json['Prezime'] as String,
  email: json['Email'] as String,
  passwordhash: json['PasswordHash'] as String,
  passwordsalt: json['PasswordSalt'] as String,
);

Map<String, dynamic> _$AdvokatToJson(Advokat instance) => <String, dynamic>{
  'Id': instance.id,
  'Ime': instance.ime,
  'Prezime': instance.prezime,
  'Email': instance.email,
  'PasswordHash': instance.passwordhash,
  'PasswordSalt': instance.passwordsalt,
};
