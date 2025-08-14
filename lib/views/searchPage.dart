import 'package:flutter/material.dart';
import 'package:flutter_pocetok/notifikacii.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

void _openNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsPage()),
    );}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:  Theme.of(context).appBarTheme.backgroundColor,
      title: const Text('Пребарување'),
      actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Нотификации',
            onPressed: () => _openNotifications(context),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Функција за пребарување (во развој)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}