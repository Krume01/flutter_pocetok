import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> notifications = [
      {
        'title': 'Судење утре',
        'message': 'Имате судење за предмет #123 во 10:30',
      },
      {
        'title': 'Рок за документ',
        'message': 'Поднесете доказ до петок за предмет #456',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Нотификации')),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.yellow),
            title: Text(notif['title'] ?? 'Без наслов'),
            subtitle: Text(notif['message'] ?? 'Без порака'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // подоцна можеш да отвориш детали за предмет
            },
          );
        },
      ),
    );
  }
}