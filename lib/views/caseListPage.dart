import 'package:flutter/material.dart';
import '../models/case.dart';
import '../service/api_service.dart';
import 'addCase.dart';
import 'package:dio/dio.dart';

class CaseListPage extends StatefulWidget {
  const CaseListPage({super.key});

  @override
  State<CaseListPage> createState() => _CaseListPageState();
}

class _CaseListPageState extends State<CaseListPage> {
  late ApiService api;
  List<Case> cases = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    api = ApiService(Dio());
    _fetchCases();
  }

  Future<void> _fetchCases() async {
    try {
      final fetchedCases = await api.getCases();
      setState(() {
        cases = fetchedCases;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Грешка при вчитување: $e')),
      );
    }
  }

  Future<void> _addNewCase() async {
    final newCase = await Navigator.push<Case>(
      context,
      MaterialPageRoute(builder: (_) => const AddCasePage()),
    );

    if (newCase != null) {
      _fetchCases(); // обнови ги од backend
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Листа на предмети")),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchCases,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: cases.length,
                itemBuilder: (context, index) {
                  final c = cases[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ExpansionTile(
                      title: Text("Предмет бр. ${c.brojPredmet ?? "Нема"}"),
                      subtitle: Text("${c.tuzitel ?? "Нема"} против ${c.tuzen ?? "Нема"}"),
                      childrenPadding: const EdgeInsets.all(12),
                      children: [
                        Text("Основ: ${c.osnov ?? "Нема"}"),
                        Text("Вредност: ${c.cena?.toString() ?? "Нема"}"),
                        Text("Судија: ${c.sudija ?? "Нема"}"),
                        Text("Суд: ${c.sud ?? "Нема"}"),
                        Text("Судница број: ${c.sudnicaBroj ?? "Нема"}"),
                        Text("Расправи: ${c.raspravi != null ? c.raspravi!.toLocal().toString().split(" ")[0] : "Нема"}"),
                        Text("Рок за приговор: ${c.rokPrigovor != null ? c.rokPrigovor!.toLocal().toString().split(" ")[0] : "Нема"}"),
                        Text("Жалба: ${c.zalba != null ? c.zalba!.toLocal().toString().split(" ")[0] : "Нема"}"),
                        Text("Одговор на жалба: ${c.odgovorZalba != null ? c.odgovorZalba!.toLocal().toString().split(" ")[0] : "Нема"}"),
                        Text("Ревизија: ${c.revizija != null ? c.revizija!.toLocal().toString().split(" ")[0] : "Нема"}"),
                        Text("Одговор на ревизија: ${c.odgovorRevizija != null ? c.odgovorRevizija!.toLocal().toString().split(" ")[0] : "Нема"}"),
                        Text("Договорена награда: ${c.dogovorenaNagrada?.toString() ?? "Нема"}"),
                        Text("Договор за адвокатска награда: ${c.dogovorAdvokatskaNagrada ?? "Нема"}"),
                        Text("Исплатено: ${c.isplatenoNaDen != null ? c.isplatenoNaDen!.toLocal().toString().split(" ")[0] : "Нема"}"),
                        Text("Платен налог: ${c.platenNalogNotar ?? "Нема"}"),
                        Text("Извршна постапка: ${c.izvrsnaPostapkaIzvrsitelBroj ?? "Нема"}"),
                      ],
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewCase,
        child: const Icon(Icons.add),
      ),
    );
  }
}
