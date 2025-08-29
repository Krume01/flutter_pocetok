import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'package:flutter_pocetok/views/loginPage.dart'; // за LoginPage

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_notificationsEnabled
            ? "Нотификациите се вклучени"
            : "Нотификациите се исклучени"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: const Text('Поставки'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 24),

            // Dark Mode
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Switch(
                  value: isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme(value);
                  },
                  activeColor: Colors.deepPurple,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Notifications
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Нотификации',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Switch(
                  value: _notificationsEnabled,
                  onChanged: _toggleNotifications,
                  activeColor: Colors.blueAccent,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Logout
            ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text('Одјави се'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              onPressed: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
