import 'package:flutter/material.dart';

class SupplierManagementPage extends StatelessWidget {
  const SupplierManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Supplier Management',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Add Supplier Button
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.add),
                label: const Text("Add Supplier"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const AddSupplierDialog(),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Supplier Table
            const Expanded(child: SupplierTable()),
          ],
        ),
      ),
    );
  }
}

class SupplierTable extends StatelessWidget {
  const SupplierTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data
    final suppliers = [
      {
        'name': 'ABC Supplies',
        'contact': '0911-123456',
        'email': 'abc@supplies.com',
      },
      {
        'name': 'Green Agro',
        'contact': '0912-456789',
        'email': 'green@agro.com',
      },
      {
        'name': 'Tech Imports',
        'contact': '0913-987654',
        'email': 'info@techimports.com',
      },
    ];

    return Card(
      elevation: 3,
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Supplier Name')),
          DataColumn(label: Text('Contact')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Actions')),
        ],
        rows:
            suppliers.map((supplier) {
              return DataRow(
                cells: [
                  DataCell(Text(supplier['name']!)),
                  DataCell(Text(supplier['contact']!)),
                  DataCell(Text(supplier['email']!)),
                  DataCell(
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // Add edit logic
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Add delete logic
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
      ),
    );
  }
}

class AddSupplierDialog extends StatelessWidget {
  const AddSupplierDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final contactController = TextEditingController();
    final emailController = TextEditingController();

    return AlertDialog(
      title: const Text('Add New Supplier'),
      content: SizedBox(
        width: 400,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Supplier Name'),
            ),
            TextField(
              controller: contactController,
              decoration: const InputDecoration(labelText: 'Contact Number'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          child: const Text('Save'),
          onPressed: () {
            // Add save logic
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
