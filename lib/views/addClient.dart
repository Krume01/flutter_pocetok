import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/klient.dart';
import '../service/api_service.dart';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  final _formKey = GlobalKey<FormState>();

  final _imeController = TextEditingController();
  final _prezimeController = TextEditingController();
  final _telefonController = TextEditingController();

  @override
  void dispose() {
    _imeController.dispose();
    _prezimeController.dispose();
    _telefonController.dispose();
    super.dispose();
  }

  Future<void> _saveClient() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пополнете ги сите полиња')),
      );
      return;
    }

    final novKlient = Klient(
      ime: _imeController.text.trim(),
      prezime: _prezimeController.text.trim(),
      telefon: _telefonController.text.trim(),
    );

    try {
      final dio = Dio();
      final api = ApiService(dio);

      await api.addKlient(novKlient.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Клиентот е успешно зачуван!')),
      );

      Navigator.pop(context, novKlient);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Грешка при зачувување: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Нов клиент")),
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
            const SizedBox(height: 12),
            TextFormField(
              controller: _prezimeController,
              decoration: const InputDecoration(labelText: "Презиме"),
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _telefonController,
              decoration: const InputDecoration(labelText: "Телефон"),
              keyboardType: TextInputType.phone,
              validator: (v) => v!.isEmpty ? "Задолжително" : null,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveClient,
              child: const Text("Зачувај клиент"),
            ),
          ],
        ),
      ),
    );
  }
}
