import 'package:flutter/material.dart';
import 'package:flutter_pocetok/views/addCase.dart';
import 'package:flutter_pocetok/notifikacii.dart';

class PocetnaPage extends StatefulWidget {
  const PocetnaPage({super.key});

  @override
  State<PocetnaPage> createState() => _PocetnaPageState();
}

class _PocetnaPageState extends State<PocetnaPage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> _clients = ['Клиент 1', 'Клиент 2', 'Клиент 3'];

  void _openNotifications(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const NotificationsPage()),
    );
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
    return Padding(
      padding: const EdgeInsets.only(top: 34, left: 16, right: 16, bottom: 86),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 14),
          const TextField(decoration: InputDecoration(labelText: 'Име')),
          const SizedBox(height: 22),
          const TextField(decoration: InputDecoration(labelText: 'Презиме')),
          const SizedBox(height: 12),
          const TextField(decoration: InputDecoration(labelText: 'Телефон')),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddCasePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 26),
            ),
            child: const Text('Зачувај клиент и додади предмет'),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshClients() async {
    // Симулирање на network call со delay
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      // Само прецртај ја листата, без да се додава нов клиент
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Почетна'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            tooltip: 'Нотификации',
            onPressed: () => _openNotifications(context),
          ),
        ],
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: theme.cardColor,
              ),
              onChanged: (value) {
                // TODO: додади филтрирање
              },
            ),
          ),
          Expanded(
  child: RefreshIndicator(
    onRefresh: _refreshClients,
    color: colorScheme.primary,
    child: ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _clients.length,
      itemBuilder: (context, index) {
        final client = _clients[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(client),
            trailing: PopupMenuButton<String>(
              icon: const Icon(Icons.settings),
              onSelected: (value) {
                if (value == 'edit') {
                  // TODO: отвори форма за менување информации за клиент
                } else if (value == 'delete') {
                  // TODO: избриши клиент од листата/базата
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'edit',
                  child: Text('Промени информации'),
                ),
                const PopupMenuItem(
                  value: 'delete',
                  child: Text('Избриши'),
                ),
              ],
            ),
            onTap: () {
              // TODO: при клик да се прикажат податоците од базата
            },
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
