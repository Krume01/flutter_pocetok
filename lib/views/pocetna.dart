import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_pocetok/notifikacii.dart';
import 'package:flutter_pocetok/views/calendar.dart';
import 'package:flutter_pocetok/views/settings.dart';


class PocetnaPage extends StatefulWidget {
  const PocetnaPage({super.key});

  @override
  State<PocetnaPage> createState() => _PocetnaPageState();
}

class _PocetnaPageState extends State<PocetnaPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _clients = [];
  List<Map<String, dynamic>> _filteredClients = [];

  @override
  void initState() {
    super.initState();
    _loadClientsFromApi();
    _searchController.addListener(_filterClients);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterClients);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadClientsFromApi() async {
    final url = Uri.parse('http://10.0.2.2:5000/api/clients'); // замени ако треба
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _clients = data.cast<Map<String, dynamic>>();
          _filteredClients = List.from(_clients);
        });
      } else {
        debugPrint('Грешка при вчитување: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Грешка: $e');
    }
  }

  void _filterClients() {
    final query = (_searchController.text).toLowerCase();
    setState(() {
      _filteredClients = _clients.where((client) {
        final fullName = '${client['ime']} ${client['prezime']}'.toLowerCase();
        final phone = (client['telefon'] ?? '').toLowerCase();
        return fullName.contains(query) || phone.contains(query);
      }).toList();
    });
  }

  void _openAddClientForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: _buildAddClientForm(),
      ),
    );
  }

  Widget _buildAddClientForm() {
    final imeController = TextEditingController();
    final prezimeController = TextEditingController();
    final telefonController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 34, left: 16, right: 16, bottom: 86),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(controller: imeController, decoration: const InputDecoration(labelText: 'Име')),
          const SizedBox(height: 12),
          TextField(controller: prezimeController, decoration: const InputDecoration(labelText: 'Презиме')),
          const SizedBox(height: 12),
          TextField(controller: telefonController, decoration: const InputDecoration(labelText: 'Телефон')),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () async {
              final ime = imeController.text.trim();
              final prezime = prezimeController.text.trim();
              final telefon = telefonController.text.trim();

              if (ime.isEmpty || prezime.isEmpty || telefon.isEmpty) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Пополнете ги сите полиња')),
                );
                return;
              }

              final url = Uri.parse('http://10.0.2.2:5000/api/clients');

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
                  if (!mounted) return;
                  setState(() {
                    _clients.add({'ime': ime, 'prezime': prezime, 'telefon': telefon});
                    _filterClients();
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Клиентот е успешно зачуван')),
                  );

                  Navigator.pop(context);
                } else {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Грешка: ${response.statusCode}')),
                  );
                }
              } catch (e) {
                if (!mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Грешка при поврзување: $e')),
                );
              }
            },
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 26)),
            child: const Text('Зачувај клиент'),
          ),
        ],
      ),
    );
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Потврда'),
        content: const Text('Дали сигурно сакате да го избришете клиентот?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Откажи')),
          TextButton(
            onPressed: () {
              if (!mounted) return;
              setState(() {
                _clients.removeAt(index);
                _filterClients();
              });
              Navigator.pop(context);
            },
            child: const Text('Избриши', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Почетна')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: colorScheme.primary),
              child: Text('Мени', style: TextStyle(color: colorScheme.onPrimary, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: const Text('Календар'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CalendarWidget())),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Нотификации'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsPage())),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Поставки'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage())),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Пребарај клиент...',
                prefixIcon: Icon(Icons.search, color: colorScheme.onSurface),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: theme.cardColor,
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _loadClientsFromApi,
              color: colorScheme.primary,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _filteredClients.length,
                itemBuilder: (context, index) {
                  final client = _filteredClients[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(client['ime'] ?? ''),
                      subtitle: Text('${client['prezime'] ?? ''} • ${client['telefon'] ?? ''}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _confirmDelete(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _openAddClientForm,
        label: const Text('Нов клиент'),
        icon: const Icon(Icons.person_add),
      ),
    );
  }
}
