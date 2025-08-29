import 'package:flutter/material.dart';

class EditClientPage extends StatefulWidget {
  final String ime;
  final String prezime;
  final String telefon;
  final ValueChanged<Map<String, String>> onSave;

  const EditClientPage({
    super.key,
    required this.ime,
    required this.prezime,
    required this.telefon,
    required this.onSave,
  });

  @override
  State<EditClientPage> createState() => _EditClientPageState();
}

class _EditClientPageState extends State<EditClientPage> {
  late TextEditingController _imeController;
  late TextEditingController _prezimeController;
  late TextEditingController _telefonController;

  @override
  void initState() {
    super.initState();
    _imeController = TextEditingController(text: widget.ime);
    _prezimeController = TextEditingController(text: widget.prezime);
    _telefonController = TextEditingController(text: widget.telefon);
  }

  @override
  void dispose() {
    _imeController.dispose();
    _prezimeController.dispose();
    _telefonController.dispose();
    super.dispose();
  }

  void _saveClient() {
    widget.onSave({
      'ime': _imeController.text,
      'prezime': _prezimeController.text,
      'telefon': _telefonController.text,
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Уреди клиент"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _imeController,
              decoration: const InputDecoration(labelText: "Име"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _prezimeController,
              decoration: const InputDecoration(labelText: "Презиме"),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _telefonController,
              decoration: const InputDecoration(labelText: "Телефон"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _saveClient,
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: colorScheme.onPrimary,
              ),
              child: const Text("Зачувај"),
            )
          ],
        ),
      ),
    );
  }
}
