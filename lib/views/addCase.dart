import 'package:flutter/material.dart';

class AddCasePage extends StatelessWidget {
  const AddCasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: const Text('Нов предмет')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(labelText: 'Назив на предмет'),
            ),
            SizedBox(height: 22),
            TextField(
              decoration: InputDecoration(labelText: 'Опис'),
            ),
            SizedBox(height: 39),
            ElevatedButton(
              onPressed: null, // ќе додадеме функционалност подоцна
              child: Text('Зачувај предмет'),
            ),
          ],
        ),
      ),
    );
  }
}