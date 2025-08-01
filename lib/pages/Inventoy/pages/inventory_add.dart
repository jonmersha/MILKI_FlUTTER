import 'package:flutter/material.dart';

Future<Map<String, dynamic>?> showAddInventoryModal(
  BuildContext context, {
  required String storeName,
}) {
  final productNameController = TextEditingController();
  final quantityController = TextEditingController();

  return showDialog<Map<String, dynamic>>(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text('Add Product to $storeName'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: productNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
              ),
              TextField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantity'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'storeName': storeName,
                  'productName': productNameController.text,
                  'quantity': int.tryParse(quantityController.text) ?? 0,
                });
              },
              child: const Text('Add'),
            ),
          ],
        ),
  );
}
