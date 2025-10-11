import 'package:flutter/material.dart';
import '../models/case.dart';
import '../service/api_service.dart';
import 'package:dio/dio.dart';

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
  final _tipKlientController=TextEditingController();

  DateTime? _rokPrigovor;
  DateTime? _raspravi;
  DateTime? _zalba;
  DateTime? _odgovorZalba;
  DateTime? _revizija;
  DateTime? _odgovorRevizija;
  DateTime? _isplatenoNaDen;

  bool _isplateno = false;

  Future<void> _saveCase() async {
    if (!_formKey.currentState!.validate() || _rokPrigovor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Пополнете ги сите полиња и одберете датум"),
        ),
      );
      return;
    }

    final noviPredmet = Case(
      tipKlient:_tipKlientController.text.trim(),
      tuzitel: _tuzitelController.text.trim(),
      tuzen: _tuzenController.text.trim(),
      osnov: _osnovController.text.trim(),
      cena: double.tryParse(_cenaController.text.trim()) ?? 0,
      brojPredmet: _brojPredmetController.text.trim(),
      sudija: _sudijaController.text.trim(),
      sudnicaBroj: _sudnicaBrojController.text.trim(),
      sud: _sudController.text.trim(),
      raspravi: _raspravi,
      rokPrigovor: _rokPrigovor,
      zalba: _zalba,
      odgovorZalba: _odgovorZalba,
      revizija: _revizija,
      odgovorRevizija: _odgovorRevizija,
      dogovorenaNagrada:
          double.tryParse(_dogovorenaNagradaController.text.trim()) ?? 0,
      dogovorAdvokatskaNagrada: _dogovorAdvokatskaNagradaController.text.trim(),
      isplatenoNaDen: _isplatenoNaDen,
      platenNalogNotar: _platenNalogNotarController.text.trim(),
      izvrsnaPostapkaIzvrsitelBroj:
          _izvrsnaPostapkaIzvrsitelBrojController.text.trim(),
    );

    try {
      final dio = Dio();
      final api = ApiService(dio);

      await api.addCase(noviPredmet.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Предметот е успешно зачуван!")),
      );

      Navigator.pop(context, noviPredmet);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Грешка при зачувување: $e")),
      );
    }
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
    _tipKlientController.dispose();
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
              controller: _tipKlientController,
              decoration: const InputDecoration(labelText: "Тип на клиент"),
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
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
            _buildDateField("Рок за приговор", _rokPrigovorController,
                (picked) => _rokPrigovor = picked),
            _buildDateField("Рок за расправи", _raspraviController,
                (picked) => _raspravi = picked),
            _buildDateField(
                "Рок за жалба", _zalbaController, (picked) => _zalba = picked),
            _buildDateField("Рок за одговор за жалба", _odgovorZalbaController,
                (picked) => _odgovorZalba = picked),
            _buildDateField("Рок за ревизија", _revizijaController,
                (picked) => _revizija = picked),
            _buildDateField("Одговор за ревизија", _odgovorRevizijaController,
                (picked) => _odgovorRevizija = picked),
            _buildDateField("Исплатено на ден", _isplatenoNaDenController,
                (picked) => _isplatenoNaDen = picked),
            TextFormField(
              controller: _dogovorenaNagradaController,
              decoration:
                  const InputDecoration(labelText: "Договорена награда"),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: _dogovorAdvokatskaNagradaController,
              decoration: const InputDecoration(
                  labelText: "Договор за адвокатска награда"),
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
              decoration: const InputDecoration(
                  labelText: "Извршна постапка(Извршител и бр.)"),
            ),
            ElevatedButton(
                onPressed: _saveCase, child: const Text("Зачувај предмет")),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDateField(
    String label,
    TextEditingController controller,
    Function(DateTime) onPicked,
  ) {
    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(labelText: label),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          setState(() {
            onPicked(picked);
            controller.text = "${picked.toLocal()}".split(" ")[0];
          });
        }
      },
    );
  }
}
