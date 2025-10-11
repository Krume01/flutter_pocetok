// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Case _$CaseFromJson(Map<String, dynamic> json) => Case(
  tipKlient: json['tipKlient'] as String?,
  tuzitel: json['tuzitel'] as String?,
  tuzen: json['tuzen'] as String?,
  osnov: json['osnov'] as String?,
  cena: (json['cena'] as num?)?.toDouble(),
  brojPredmet: json['brojPredmet'] as String?,
  sudija: json['sudija'] as String?,
  sudnicaBroj: json['sudnicaBroj'] as String?,
  sud: json['sud'] as String?,
  raspravi: json['raspravi'] == null
      ? null
      : DateTime.parse(json['raspravi'] as String),
  rokPrigovor: json['rokPrigovor'] == null
      ? null
      : DateTime.parse(json['rokPrigovor'] as String),
  zalba: json['zalba'] == null ? null : DateTime.parse(json['zalba'] as String),
  odgovorZalba: json['odgovorZalba'] == null
      ? null
      : DateTime.parse(json['odgovorZalba'] as String),
  revizija: json['revizija'] == null
      ? null
      : DateTime.parse(json['revizija'] as String),
  odgovorRevizija: json['odgovorRevizija'] == null
      ? null
      : DateTime.parse(json['odgovorRevizija'] as String),
  dogovorenaNagrada: (json['dogovorenaNagrada'] as num?)?.toDouble(),
  dogovorAdvokatskaNagrada: json['dogovorAdvokatskaNagrada'] as String?,
  isplatenoNaDen: json['isplatenoNaDen'] == null
      ? null
      : DateTime.parse(json['isplatenoNaDen'] as String),
  platenNalogNotar: json['platenNalogNotar'] as String?,
  izvrsnaPostapkaIzvrsitelBroj: json['izvrsnaPostapkaIzvrsitelBroj'] as String?,
);

Map<String, dynamic> _$CaseToJson(Case instance) => <String, dynamic>{
  'tuzitel': instance.tuzitel,
  'tuzen': instance.tuzen,
  'osnov': instance.osnov,
  'cena': instance.cena,
  'brojPredmet': instance.brojPredmet,
  'sudija': instance.sudija,
  'sudnicaBroj': instance.sudnicaBroj,
  'sud': instance.sud,
  'raspravi': instance.raspravi?.toIso8601String(),
  'rokPrigovor': instance.rokPrigovor?.toIso8601String(),
  'zalba': instance.zalba?.toIso8601String(),
  'odgovorZalba': instance.odgovorZalba?.toIso8601String(),
  'revizija': instance.revizija?.toIso8601String(),
  'odgovorRevizija': instance.odgovorRevizija?.toIso8601String(),
  'dogovorenaNagrada': instance.dogovorenaNagrada,
  'dogovorAdvokatskaNagrada': instance.dogovorAdvokatskaNagrada,
  'isplatenoNaDen': instance.isplatenoNaDen?.toIso8601String(),
  'platenNalogNotar': instance.platenNalogNotar,
  'izvrsnaPostapkaIzvrsitelBroj': instance.izvrsnaPostapkaIzvrsitelBroj,
  'tipKlient': instance.tipKlient,
};
