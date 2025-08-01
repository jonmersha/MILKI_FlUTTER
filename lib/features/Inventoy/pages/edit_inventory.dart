import 'package:flutter/material.dart';

Future<Map<String, dynamic>?> showEditInventoryModal(
  BuildContext context, {
  required Map<String, dynamic> product,
}) {
  final productNameController = TextEditingController(
    text: product['productName'],
  );
  final quantityController = TextEditingController(
    text: product['quantity'].toString(),
  );

  return showDialog<Map<String, dynamic>>(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text('Edit ${product['productName']}'),
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
                  ...product,
                  'productName': productNameController.text,
                  'quantity':
                      int.tryParse(quantityController.text) ??
                      product['quantity'],
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
  );
}
