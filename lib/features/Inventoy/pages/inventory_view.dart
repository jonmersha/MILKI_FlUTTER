import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/features/Inventoy/pages/edit_inventory.dart';
import 'package:milkifoodcomplex/features/Inventoy/pages/inventory_add.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  Map<String, List<Map<String, dynamic>>> inventory = {
    'Store A': [
      {'productName': 'Flour', 'quantity': 100, 'date': DateTime.now()},
    ],
    'Store B': [
      {'productName': 'Sugar', 'quantity': 50, 'date': DateTime.now()},
    ],
  };

  final Map<String, bool> storeExpanded = {'Store A': true, 'Store B': true};

  void _addProduct(String storeName) async {
    final newProduct = await showAddInventoryModal(
      context,
      storeName: storeName,
    );
    if (newProduct != null) {
      setState(() {
        inventory[storeName]!.add({...newProduct, 'date': DateTime.now()});
      });
    }
  }

  void _editProduct(String storeName, int index) async {
    final product = inventory[storeName]![index];
    final updatedProduct = await showEditInventoryModal(
      context,
      product: product,
    );
    if (updatedProduct != null) {
      setState(() {
        inventory[storeName]![index] = {
          ...updatedProduct,
          'date': DateTime.now(),
        };
      });
    }
  }

  void _deleteProduct(String storeName, int index) {
    setState(() {
      inventory[storeName]!.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inventory Management')),
      body: ListView(
        children:
            inventory.keys.map((storeName) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ExpansionTile(
                  initiallyExpanded: storeExpanded[storeName] ?? true,
                  onExpansionChanged: (expanded) {
                    setState(() {
                      storeExpanded[storeName] = expanded;
                    });
                  },
                  backgroundColor: Colors.cyan.shade50,
                  title: Text(
                    storeName,
                    style: const TextStyle(color: Colors.cyan),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () => _addProduct(storeName),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Product')),
                          DataColumn(label: Text('Quantity')),
                          DataColumn(label: Text('Last Updated')),
                          DataColumn(label: Text('Actions')),
                        ],
                        rows:
                            inventory[storeName]!.asMap().entries.map((entry) {
                              final index = entry.key;
                              final product = entry.value;
                              return DataRow(
                                cells: [
                                  DataCell(Text(product['productName'])),
                                  DataCell(
                                    Text(product['quantity'].toString()),
                                  ),
                                  DataCell(
                                    Text(
                                      (product['date'] as DateTime)
                                          .toString()
                                          .split('.')[0],
                                    ),
                                  ),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                          ),
                                          onPressed:
                                              () => _editProduct(
                                                storeName,
                                                index,
                                              ),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed:
                                              () => _deleteProduct(
                                                storeName,
                                                index,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
      ),
    );
  }
}
