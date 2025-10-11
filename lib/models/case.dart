import 'package:json_annotation/json_annotation.dart';

part 'case.g.dart';

@JsonSerializable()
class Case {
  String? tuzitel;
  String? tuzen;
  String? osnov;
  double? cena;
  String? brojPredmet;
  String? sudija;
  String? sudnicaBroj;
  String? sud;
  DateTime? raspravi;
  DateTime? rokPrigovor;
  DateTime? zalba;
  DateTime? odgovorZalba;
  DateTime? revizija;
  DateTime? odgovorRevizija;
  double? dogovorenaNagrada;
  String? dogovorAdvokatskaNagrada;
  DateTime? isplatenoNaDen;  
  String? platenNalogNotar;
  String? izvrsnaPostapkaIzvrsitelBroj;
  String? tipKlient;

  Case({
    this.tipKlient,
    this.tuzitel,//ako sakas pole da e zadolzitelno moze da go napravis required this.tuzitel
    this.tuzen,
    this.osnov,
    this.cena,
    this.brojPredmet,
    this.sudija,
    this.sudnicaBroj,
    this.sud,
    this.raspravi,
    this.rokPrigovor,
    this.zalba,
    this.odgovorZalba,
    this.revizija,
    this.odgovorRevizija,
    this.dogovorenaNagrada,
    this.dogovorAdvokatskaNagrada,
    this.isplatenoNaDen,
    this.platenNalogNotar,
    this.izvrsnaPostapkaIzvrsitelBroj,
  });

  factory Case.fromJson(Map<String, dynamic> json) => _$CaseFromJson(json);
  Map<String, dynamic> toJson() => _$CaseToJson(this);
}
