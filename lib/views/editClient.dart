import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/klient.dart';
import '../service/api_service.dart';

class EditClientPage extends StatefulWidget {
  final Klient klient;

  const EditClientPage({
    super.key,
    required this.klient,
  });

  @override
  State<EditClientPage> createState() => _EditClientPageState();
}

class _EditClientPageState extends State<EditClientPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _imeController;
  late TextEditingController _prezimeController;
  late TextEditingController _telefonController;

  late ApiService api;

  @override
  void initState() {
    super.initState();
    _imeController = TextEditingController(text: widget.klient.ime);
    _prezimeController = TextEditingController(text: widget.klient.prezime);
    _telefonController = TextEditingController(text: widget.klient.telefon);

    final dio = Dio();
    api = ApiService(dio);
  }

  @override
  void dispose() {
    _imeController.dispose();
    _prezimeController.dispose();
    _telefonController.dispose();
    super.dispose();
  }

  Future<void> _saveClient() async {
    if (!_formKey.currentState!.validate()) return;

    final updated = Klient(
      id: widget.klient.id, // важно за да знае backend кој клиент да го ажурира
      ime: _imeController.text.trim(),
      prezime: _prezimeController.text.trim(),
      telefon: _telefonController.text.trim(),
    );

    try {
      await api.updateKlient(updated.id!, updated.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Клиентот е успешно ажуриран!")),
      );

      Navigator.pop(context, updated);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Грешка при ажурирање: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Уреди клиент")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _imeController,
              decoration: const InputDecoration(labelText: "Име"),
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _prezimeController,
              decoration: const InputDecoration(labelText: "Презиме"),
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _telefonController,
              decoration: const InputDecoration(labelText: "Телефон"),
              keyboardType: TextInputType.phone,
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveClient,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
              child: const Text("Зачувај"),
            ),
          ],
        ),
      ),
    );
  }
}
