import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:milkifoodcomplex/core/services/api_service.dart';

class InventoryGroupedPage extends StatefulWidget {
  const InventoryGroupedPage({super.key});

  @override
  State<InventoryGroupedPage> createState() => _InventoryGroupedPageState();
}

class _InventoryGroupedPageState extends State<InventoryGroupedPage> {
  final ApiService _apiService = ApiService();
  Map<String, List<dynamic>> groupedData = {};
  Map<String, String> filters = {};
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchInventory();
  }

  Future<void> fetchInventory() async {
    try {
      final data = await _apiService.getData(20);
      final Map<String, List<dynamic>> grouped = {};

      for (var item in data) {
        final storeName = item['store_name'] ?? 'Unknown';
        grouped.putIfAbsent(storeName, () => []).add(item);
      }

      setState(() {
        groupedData = grouped;
        filters = {for (var key in grouped.keys) key: ''};
        loading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => loading = false);
    }
  }

  void openAddModal(dynamic storeName) async {
    final result = await showDialog(
      context: context,
      builder: (_) => AddEditInventoryModal(item: {'store_name': storeName}),
    );
    if (result == true) fetchInventory();
  }

  void openEditModal(Map<String, dynamic> item) async {
    final result = await showDialog(
      context: context,
      builder: (_) => AddEditInventoryModal(item: item),
    );
    if (result == true) fetchInventory();
  }

  void deleteItem(Map<String, dynamic> item) async {
    final confirmed = await showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Confirm Delete"),
            content: Text(
              "Are you sure you want to delete '${item['product_name']}'?",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text("Delete"),
              ),
            ],
          ),
    );

    if (confirmed == true) {
      await _apiService.deleteData(20, item['id']);
      fetchInventory();
    }
  }

  List<dynamic> filterItems(List<dynamic> products, String filter) {
    return filter.isEmpty
        ? products
        : products.where((p) {
          final text =
              "${p['product_name'] ?? ''} ${p['code'] ?? ''}".toLowerCase();
          return text.contains(filter.toLowerCase());
        }).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: const Text("Inventory by Store")),
      body: ListView(
        children:
            groupedData.entries.map((entry) {
              final store = entry.key;
              final products = filterItems(entry.value, filters[store] ?? '');

              return Card(
                margin: const EdgeInsets.all(12),
                child: ExpansionTile(
                  initiallyExpanded: true,
                  tilePadding: EdgeInsets.zero,
                  title: Container(
                    padding: const EdgeInsets.all(12),
                    color: Colors.cyan.shade200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          store,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          tooltip: "Add Product",
                          onPressed: () => openAddModal(store),
                        ),
                      ],
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      child: TextField(
                        decoration: const InputDecoration(
                          labelText: 'Filter products...',
                          prefixIcon: Icon(Icons.search),
                        ),
                        onChanged:
                            (value) => setState(() => filters[store] = value),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: WidgetStateProperty.all(
                          Colors.grey[200],
                        ),
                        columns: const [
                          DataColumn(label: Text("Code")),
                          DataColumn(label: Text("Name")),
                          DataColumn(label: Text("Quantity")),
                          DataColumn(label: Text("Unit")),
                          DataColumn(label: Text("Updated At")),
                          DataColumn(label: Text("Actions")),
                        ],
                        rows:
                            products.map((product) {
                              final updatedAt = product['updated_at'];
                              final dateFormatted =
                                  updatedAt != null
                                      ? DateFormat('yyyy-MM-dd HH:mm').format(
                                        DateTime.tryParse(updatedAt) ??
                                            DateTime.now(),
                                      )
                                      : "-";

                              return DataRow(
                                cells: [
                                  DataCell(Text(product['code'] ?? '')),
                                  DataCell(Text(product['product_name'] ?? '')),
                                  DataCell(Text("${product['quantity'] ?? 0}")),
                                  DataCell(Text(product['unit'] ?? '')),
                                  DataCell(Text(dateFormatted)),
                                  DataCell(
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.edit,
                                            color: Colors.orange,
                                          ),
                                          onPressed:
                                              () => openEditModal(product),
                                        ),
                                        IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                          onPressed: () => deleteItem(product),
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
