import 'package:flutter/material.dart';
import 'package:flutter_pocetok/views/settings.dart';
import 'package:flutter_pocetok/views/pocetna.dart';
import 'package:flutter_pocetok/views/searchPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const PocetnaPage(),
    const SearchPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Почетна',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Пребарување',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Поставки',
          ),
        ],
      ),
    );
  }
}

// ------------------------ NOTIFICATIONS PAGE ------------------------

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
        title: const Text('Нотификации'),
      ),
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
