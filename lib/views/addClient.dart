import 'package:flutter/material.dart';
import 'package:flutter_pocetok/notifikacii.dart';
import 'package:flutter_pocetok/views/addCase.dart';

class AddClientPage extends StatelessWidget {
  const AddClientPage({super.key});
  
void _openNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsPage()),
    );}

  void _navigateToAddCase(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddCasePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: const Text('Нов клиент'),
      actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Нотификации',
            onPressed: () => _openNotifications(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Име'),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(labelText: 'Презиме'),
            ),
            const SizedBox(height: 12),
            const TextField(
              decoration: InputDecoration(labelText: 'Телефон'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => _navigateToAddCase(context),
              child: const Text('Зачувај клиент и додади предмет'),
              style:ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
                foregroundColor: Colors.black
              )
            ),
          ],
        ),
      ),
    );
  }
}