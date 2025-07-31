import 'package:flutter/material.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  final List<Map<String, dynamic>> _inventoryData = const [
    {
      'item': 'Wheat Flour',
      'quantity': 120,
      'unit': 'kg',
      'category': 'Grains',
      'factory': 'Addis Milling Co.',
      'warehouse': 'Warehouse A',
    },
    {
      'item': 'Tomato Sauce',
      'quantity': 75,
      'unit': 'liters',
      'category': 'Sauces',
      'factory': 'Fresh Foods Ltd.',
      'warehouse': 'Warehouse B',
    },
    {
      'item': 'Cooking Oil',
      'quantity': 200,
      'unit': 'liters',
      'category': 'Oils',
      'factory': 'Golden Oil Factory',
      'warehouse': 'Warehouse A',
    },
    {
      'item': 'Rice',
      'quantity': 350,
      'unit': 'kg',
      'category': 'Grains',
      'factory': 'Addis Milling Co.',
      'warehouse': 'Warehouse C',
    },
    {
      'item': 'Plastic Containers',
      'quantity': 500,
      'unit': 'pcs',
      'category': 'Packaging',
      'factory': 'PackWell Inc.',
      'warehouse': 'Warehouse B',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Current Inventory Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: _inventoryData.length,
                separatorBuilder: (_, __) => const Divider(),
                itemBuilder: (context, index) {
                  final item = _inventoryData[index];
                  return ListTile(
                    leading: const Icon(Icons.inventory_2),
                    title: Text(item['item']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Category: ${item['category']}'),
                        Text('Factory: ${item['factory']}'),
                        Text('Warehouse: ${item['warehouse']}'),
                      ],
                    ),
                    trailing: Text(
                      '${item['quantity']} ${item['unit']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
