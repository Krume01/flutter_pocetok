// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'klient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Klient _$KlientFromJson(Map<String, dynamic> json) => Klient(
  ime: json['ime'] as String?,
  prezime: json['prezime'] as String?,
  adresa: json['adresa'] as String?,
  telefon: json['telefon'] as String?,
  id: (json['id'] as num?)?.toInt(),
);

Map<String, dynamic> _$KlientToJson(Klient instance) => <String, dynamic>{
  'ime': instance.ime,
  'prezime': instance.prezime,
  'adresa': instance.adresa,
  'telefon': instance.telefon,
  'id': instance.id,
};
