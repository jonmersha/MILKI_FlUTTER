import 'package:flutter/material.dart';

class AddInventoryPage extends StatelessWidget {
  final String storeName;

  const AddInventoryPage({super.key, required this.storeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Inventory - $storeName')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Store'),
              controller: TextEditingController(text: storeName),
              readOnly: true,
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save logic here
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
