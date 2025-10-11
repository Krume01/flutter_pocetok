// import 'package:flutter/material.dart';
// import 'package:flutter_pocetok/views/caseDetails.dart';
// //import 'package:flutter_pocetok/views/addCase.dart';
// import 'package:flutter_pocetok/client.dart';

// class ClientDetailsPage extends StatelessWidget {
//   final Client client;

//   const ClientDetailsPage({super.key, required this.client});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Детали за клиент"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildDetailRow("Име", client.ime),
//             _buildDetailRow("Презиме", client.prezime),
//             _buildDetailRow("Телефон", client.telefon),
//             const SizedBox(height: 24),

//             // Копче за отворање на предмети
//             ElevatedButton.icon(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (_) => const CaseDetailsPage()),
//                 );
//               },
//               icon: const Icon(Icons.folder),
//               label: const Text("Предмети"),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size.fromHeight(50),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Text(
//             "$label: ",
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Expanded(child: Text(value)),
//         ],
//       ),
//     );
//   }
// }
