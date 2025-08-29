import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddClientPage extends StatefulWidget {
  const AddClientPage({super.key});

  @override
  State<AddClientPage> createState() => _AddClientPageState();
}

class _AddClientPageState extends State<AddClientPage> {
  final TextEditingController _imeController = TextEditingController();
  final TextEditingController _prezimeController = TextEditingController();
  final TextEditingController _telefonController = TextEditingController();

  @override
  void dispose() {
    _imeController.dispose();
    _prezimeController.dispose();
    _telefonController.dispose();
    super.dispose();
  }

  void _saveClient() async {
    final ime = _imeController.text.trim();
    final prezime = _prezimeController.text.trim();
    final telefon = _telefonController.text.trim();

    if (ime.isEmpty || prezime.isEmpty || telefon.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Пополнете ги сите полиња')),
      );
      return;
    }

    final url = Uri.parse('http://your-api-url.com/api/clients'); // замени со твојот URL

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'ime': ime,
          'prezime': prezime,
          'telefon': telefon,
        }),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Клиент зачуван: $ime $prezime, Телефон: $telefon');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Клиентот е успешно зачуван')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Грешка: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Грешка при поврзување: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Нов клиент'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _imeController,
              decoration: const InputDecoration(labelText: 'Име'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _prezimeController,
              decoration: const InputDecoration(labelText: 'Презиме'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _telefonController,
              decoration: const InputDecoration(labelText: 'Телефон'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveClient,
              child: const Text('Зачувај клиент'),
            ),
          ],
        ),
      ),
    );
  }
}