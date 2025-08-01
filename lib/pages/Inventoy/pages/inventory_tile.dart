// import 'package:flutter/material.dart';
// import '../../../core/services/api_service.dart';

// class InventoryGroupTile extends StatelessWidget {
//   final String storeName;
//   final List<dynamic> items;
//   final VoidCallback onChanged;

//   const InventoryGroupTile({
//     required this.storeName,
//     required this.items,
//     required this.onChanged,
//     super.key,
//   });

//   void _editItem(BuildContext context, Map<String, dynamic> item) async {
//     final result = await showDialog(
//       context: context,
//       builder: (_) => AddEditInventoryDialog(item: item),
//     );

//     if (result == true) onChanged();
//   }

//   void _deleteItem(BuildContext context, int index, int id) async {
//     final confirmed = await showDialog<bool>(
//       context: context,
//       builder:
//           (_) => AlertDialog(
//             title: const Text('Delete Item'),
//             content: const Text('Are you sure you want to delete this item?'),
//             actions: [
//               TextButton(
//                 onPressed: () => Navigator.pop(context, false),
//                 child: const Text('Cancel'),
//               ),
//               ElevatedButton(
//                 onPressed: () => Navigator.pop(context, true),
//                 child: const Text('Delete'),
//               ),
//             ],
//           ),
//     );

//     if (confirmed == true) {
//       final success = await ApiService().deleteData(index, id);
//       if (success) {
//         onChanged();
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(const SnackBar(content: Text("Item deleted.")));
//       } else {
//         ScaffoldMessenger.of(
//           context,
//         ).showSnackBar(const SnackBar(content: Text("Failed to delete item.")));
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: Text(
//         storeName,
//         style: const TextStyle(fontWeight: FontWeight.bold),
//       ),
//       children:
//           items.map((item) {
//             return ListTile(
//               title: Text('${item['product_name']} (${item['code']})'),
//               subtitle: Text(
//                 'Qty: ${item['quantity']}  |  Category: ${item['category'] ?? 'N/A'}',
//               ),
//               trailing: Wrap(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.edit, color: Colors.orange),
//                     onPressed: () => _editItem(context, item),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.delete, color: Colors.red),
//                     onPressed: () => _deleteItem(context, 20, item['id']),
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//     );
//   }
// }
