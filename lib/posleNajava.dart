//import 'package:flutter_pocetok/main.dart';
//import 'package:flutter_pocetok/notifikacii.dart';
import 'package:flutter/material.dart';

//import 'package:flutter_pocetok/views/addCase.dart';
import 'package:flutter_pocetok/views/settings.dart';
import 'package:flutter_pocetok/views/pocetna.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
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
      appBar: AppBar(
      title: const Text('Нотификации')),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return ListTile(
            leading: const Icon(Icons.notifications_active, color: Colors.yellow),
            title: Text(notif['title']!),
            subtitle: Text(notif['message']!),
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

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PocetnaPage(),


    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      );
  }
}



// ------------------------ HOME PAGE ------------------------








