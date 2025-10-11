// import 'package:flutter/material.dart';
// import 'package:flutter_pocetok/views/addCase.dart'; // тука е вистинскиот Case модел

// class CaseDetailsPage extends StatefulWidget {
//   const CaseDetailsPage({super.key});

//   @override
//   State<CaseDetailsPage> createState() => _CaseDetailsPageState();
// }

// class _CaseDetailsPageState extends State<CaseDetailsPage> {
//   List<Case> cases = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Листа на предмети")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ElevatedButton.icon(
//               onPressed: () async {
//                 final newCase = await Navigator.push<Case>(
//                   context,
//                   MaterialPageRoute(builder: (_) => const AddCasePage()),
//                 );

//                 if (newCase != null) {
//                   setState(() {
//                     cases.add(newCase);
//                   });
//                 }
//               },
//               icon: const Icon(Icons.add),
//               label: const Text("Додади нов предмет"),
//             ),
//             const SizedBox(height: 16),
//             Expanded(
//               child: cases.isEmpty
//                   ? const Center(child: Text("Нема додадени предмети"))
//                   : ListView.builder(
//                       itemCount: cases.length,
//                      itemBuilder: (context, index) {
//   final c = cases[index];
//   return Card(
//     margin: const EdgeInsets.symmetric(vertical: 8),
//     child: ExpansionTile(
//       title: Text("Предмет бр. ${c.brojPredmet ?? "Нема"}"),
//       subtitle: Text("${c.tuzitel ?? "Нема"} против ${c.tuzen ?? "Нема"}"),
//       childrenPadding: const EdgeInsets.all(12),
//       children: [
//         Text("Основ: ${c.osnov ?? "Нема"}"),
//         Text("Вредност: ${c.cena != null ? c.cena.toString() : "Нема"}"),
//         Text("Судија: ${c.sudija ?? "Нема"}"),
//         Text("Суд: ${c.sud ?? "Нема"}"),
//         Text("Судница број: ${c.sudnicaBroj ?? "Нема"}"),
//         Text("Расправи: ${c.raspravi != null ? c.raspravi!.toLocal().toString().split(" ")[0] : "Нема"}"),
//         Text("Рок за приговор: ${c.rokPrigovor != null ? c.rokPrigovor!.toLocal().toString().split(" ")[0] : "Нема"}"),
//         Text("Жалба: ${c.zalba != null ? c.zalba!.toLocal().toString().split(" ")[0] : "Нема"}"),
//         Text("Одговор на жалба: ${c.odgovorZalba != null ? c.odgovorZalba!.toLocal().toString().split(" ")[0] : "Нема"}"),
//         Text("Ревизија: ${c.revizija != null ? c.revizija!.toLocal().toString().split(" ")[0] : "Нема"}"),
//         Text("Одговор на ревизија: ${c.odgovorRevizija != null ? c.odgovorRevizija!.toLocal().toString().split(" ")[0] : "Нема"}"),
//         Text("Договорена награда: ${c.dogovorenaNagrada != null ? c.dogovorenaNagrada.toString() : "Нема"}"),
//         Text("Договор за адвокатска награда: ${c.dogovorAdvokatskaNagrada ?? "Нема"}"),
//         Text("Исплатено: ${c.isplatenoNaDen != null ? c.isplatenoNaDen!.toLocal().toString().split(" ")[0] : "Нема"}"),
//         Text("Платен налог: ${c.platenNalogNotar ?? "Нема"}"),
//         Text("Извршна постапка: ${c.izvrsnaPostapkaIzvrsitelBroj ?? "Нема"}"),
//       ],
//     ),
//   );
// },

//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
