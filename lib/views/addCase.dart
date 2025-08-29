import 'package:flutter/material.dart';

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
  DateTime? isplatenoNaDen;  
  String? dogovorAdvokatskaNagrada;
  String? platenNalogNotar;
  String? izvrsnaPostapkaIzvrsitelBroj;

  Case({
    required this.tuzitel,
    required this.tuzen,
    required this.osnov,
    required this.cena,
    required this.brojPredmet,
    required this.sudija,
    required this.sudnicaBroj,
    required this.sud,
    required this.raspravi,
    required this.rokPrigovor,
    required this.zalba,
    required this.odgovorZalba,
    required this.revizija,
    required this.odgovorRevizija,
    required this.dogovorenaNagrada,
    required this.dogovorAdvokatskaNagrada,
    required this.isplatenoNaDen,
    required this.platenNalogNotar,
    required this.izvrsnaPostapkaIzvrsitelBroj,
    
  });
}

class AddCasePage extends StatefulWidget {
  const AddCasePage({super.key});

  @override
  State<AddCasePage> createState() => _AddCasePageState();
}

class _AddCasePageState extends State<AddCasePage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _tuzitelController = TextEditingController();
  final _tuzenController = TextEditingController();
  final _osnovController = TextEditingController();
  final _cenaController = TextEditingController();
  final _brojPredmetController = TextEditingController();
  final _sudijaController = TextEditingController();
  final _sudnicaBrojController = TextEditingController();
  final _sudController = TextEditingController();
  final _raspraviController = TextEditingController();
  final _zalbaController = TextEditingController();
  final _odgovorZalbaController = TextEditingController();
  final _revizijaController = TextEditingController();
  final _odgovorRevizijaController = TextEditingController();
  final _dogovorenaNagradaController = TextEditingController();
  final _dogovorAdvokatskaNagradaController = TextEditingController();
  final _isplatenoNaDenController = TextEditingController();
  final _platenNalogNotarController = TextEditingController();
  final _izvrsnaPostapkaIzvrsitelBrojController = TextEditingController();
  final _rokPrigovorController = TextEditingController();

DateTime? _rokPrigovor;
DateTime? _raspravi;
DateTime? _zalba;
DateTime? _odgovorZalba;
DateTime? _revizija;
DateTime? _odgovorRevizija;
DateTime? _isplatenoNaDen;

  bool _isplateno = false;

  void _saveCase() {
    if (!_formKey.currentState!.validate() || _rokPrigovor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Пополнете ги сите полиња и одберете датум")),
      );
      return;
    }

    final noviPredmet = Case(
      tuzitel: _tuzitelController.text.trim(),
      tuzen: _tuzenController.text.trim(),
      osnov: _osnovController.text.trim(),
      cena: double.parse(_cenaController.text.trim()),
      brojPredmet: _brojPredmetController.text.trim(),
      sudija: _sudijaController.text.trim(),
      sudnicaBroj: _sudnicaBrojController.text.trim(),
      sud: _sudController.text.trim(),
      raspravi: _raspravi!,
      rokPrigovor: _rokPrigovor!,
      zalba: _zalba!,
      odgovorZalba: _odgovorZalba!,
      revizija: _revizija!,
      odgovorRevizija: _odgovorRevizija!,
      dogovorenaNagrada: double.parse(_dogovorenaNagradaController.text.trim()),
      dogovorAdvokatskaNagrada:_dogovorAdvokatskaNagradaController.text.trim(),
      isplatenoNaDen: _isplatenoNaDen!,
      platenNalogNotar: _platenNalogNotarController.text.trim(),
      izvrsnaPostapkaIzvrsitelBroj: _izvrsnaPostapkaIzvrsitelBrojController.text.trim(),
    );

    Navigator.pop(context, noviPredmet);
  }

  @override
  void dispose() {
    _tuzitelController.dispose();
    _tuzenController.dispose();
    _osnovController.dispose();
    _cenaController.dispose();
    _brojPredmetController.dispose();
    _sudijaController.dispose();
    _sudnicaBrojController.dispose();
    _sudController.dispose();
    _raspraviController.dispose();
    _zalbaController.dispose();
    _odgovorZalbaController.dispose();
    _revizijaController.dispose();
    _odgovorRevizijaController.dispose();
    _dogovorenaNagradaController.dispose();
    _dogovorAdvokatskaNagradaController.dispose();
    _platenNalogNotarController.dispose();
    _isplatenoNaDenController.dispose();
    _izvrsnaPostapkaIzvrsitelBrojController.dispose();
    _rokPrigovorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Додади предмет")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _tuzitelController,
              decoration: const InputDecoration(labelText: "Тужител"),
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
            TextFormField(
              controller: _tuzenController,
              decoration: const InputDecoration(labelText: "Тужен"),
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
            TextFormField(
              controller: _osnovController,
              decoration: const InputDecoration(labelText: "Основ"),
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
            TextFormField(
              controller: _cenaController,
              decoration: const InputDecoration(labelText: "Вредност"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _brojPredmetController,
              decoration: const InputDecoration(labelText: "Број предмет"),
            ),
            TextFormField(
              controller: _sudijaController,
              decoration: const InputDecoration(labelText: "Судија"),
            ),
            TextFormField(
              controller: _sudnicaBrojController,
              decoration: const InputDecoration(labelText: "Судница број"),
            ),
            TextFormField(
              controller: _sudController,
              decoration: const InputDecoration(labelText: "Суд"),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _rokPrigovorController,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Рок за приговор"),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _rokPrigovor = picked;
                    _rokPrigovorController.text =
                        "${picked.toLocal()}".split(" ")[0];
                  });
                }
              },
            ),
            TextFormField(
              controller: _raspraviController,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Рок за расправи"),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _raspravi = picked;
                    _raspraviController.text =
                        "${picked.toLocal()}".split(" ")[0];
                  });
                }
              },
            ),
              TextFormField(
              controller: _zalbaController,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Рок за жалба"),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _zalba = picked;
                    _zalbaController.text =
                        "${picked.toLocal()}".split(" ")[0];
                  });
                }
              },
            ),
              TextFormField(
              controller: _odgovorZalbaController,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Рок за одговор за жалба"),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _odgovorZalba = picked;
                    _odgovorZalbaController.text =
                        "${picked.toLocal()}".split(" ")[0];
                  });
                }
              },
            ),
              TextFormField(
              controller: _revizijaController,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Рок за ревизија"),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _revizija = picked;
                    _revizijaController.text =
                        "${picked.toLocal()}".split(" ")[0];
                  });
                }
              },
            ),
              TextFormField(
              controller: _odgovorRevizijaController,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Одговор за ревизија"),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _odgovorRevizija = picked;
                    _odgovorRevizijaController.text =                            
                        "${picked.toLocal()}".split(" ")[0];
                  });
                }
              },
            ),
              TextFormField(
              controller: _isplatenoNaDenController,
              readOnly: true,
              decoration: const InputDecoration(labelText: "Исплатено на ден"),
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _isplatenoNaDen = picked;
                    _isplatenoNaDenController.text =
                        "${picked.toLocal()}".split(" ")[0];
                  });
                }
              },
            ),
            TextFormField(
              controller: _dogovorenaNagradaController,
              decoration:
                  const InputDecoration(labelText: "Договорена награда"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _dogovorAdvokatskaNagradaController,
              decoration:
                  const InputDecoration(labelText: "Договор за адвокатска награда"),
            ),
            SwitchListTile(
              title: const Text("Исплатено"),
              value: _isplateno,
              onChanged: (val) => setState(() => _isplateno = val),
            ),
            TextFormField(
              controller: _platenNalogNotarController,
              decoration: const InputDecoration(labelText: "Платен налог(Нотар)"),
            ),
            TextFormField(
              controller: _izvrsnaPostapkaIzvrsitelBrojController,
              decoration: const InputDecoration(labelText: "Извршна постапка(Извршител и бр.)"),
            ),
           
            ElevatedButton(
                onPressed: _saveCase, child: const Text("Зачувај предмет")),
                const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
