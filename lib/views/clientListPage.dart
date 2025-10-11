import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/klient.dart';
import '../service/api_service.dart';
import 'addClient.dart';

class ClientListPage extends StatefulWidget {
  const ClientListPage({super.key});

  @override
  State<ClientListPage> createState() => _ClientListPageState();
}

class _ClientListPageState extends State<ClientListPage> {
  late ApiService api;
  List<Klient> clients = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    final dio = Dio();
    api = ApiService(dio);
    _fetchClients();
  }

  Future<void> _fetchClients() async {
    try {
      final data = await api.getKlienti();
      setState(() {
        clients = data;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      print("Error: $e"); // за дебагирање
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Грешка при вчитување клиенти: $e")),
      );
    }
  }

  Future<void> _addClient() async {
    final newClient = await Navigator.push<Klient>(
      context,
      MaterialPageRoute(builder: (_) => const AddClientPage()),
    );

    if (newClient != null) {
      _fetchClients(); // освежи листа по додавање
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Листа на клиенти")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : clients.isEmpty
              ? const Center(child: Text("Нема клиенти"))
              : ListView.builder(
                  itemCount: clients.length,
                  itemBuilder: (context, index) {
                    final c = clients[index];
                    return ListTile(
                      title: Text("${c.ime ?? ''} ${c.prezime ?? ''}"),
                      subtitle: Text(c.telefon ?? ''),
                      onTap: () {
                        // тука можеш да отвориш ClientDetailsPage ако сакаш
                      },
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addClient,
        child: const Icon(Icons.add),
      ),
    );
  }
}
