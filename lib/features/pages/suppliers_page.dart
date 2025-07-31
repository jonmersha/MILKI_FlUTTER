import 'package:flutter/material.dart';

class SuppliersPage extends StatelessWidget {
  const SuppliersPage({super.key});

  final List<Map<String, dynamic>> _suppliers = const [
    {
      'name': 'Addis Food Suppliers',
      'contact': '+251 911 123456',
      'email': 'contact@addisfood.com',
      'address': 'Bole, Addis Ababa',
      'status': 'Active',
    },
    {
      'name': 'Fresh Farm Produce',
      'contact': '+251 912 654321',
      'email': 'info@freshfarm.com',
      'address': 'Hawassa',
      'status': 'Active',
    },
    {
      'name': 'Packaging Solutions Ltd.',
      'contact': '+251 913 789012',
      'email': 'sales@packagingsolutions.com',
      'address': 'Adama',
      'status': 'Inactive',
    },
    {
      'name': 'ColdChain Distributors',
      'contact': '+251 914 345678',
      'email': 'support@coldchain.com',
      'address': 'Mekelle',
      'status': 'Active',
    },
  ];

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return Colors.green;
      case 'inactive':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suppliers')),
      body: ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: _suppliers.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final supplier = _suppliers[index];
          return Card(
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _statusColor(supplier['status']),
                child: const Icon(Icons.local_shipping, color: Colors.white),
              ),
              title: Text(supplier['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Contact: ${supplier['contact']}'),
                  Text('Email: ${supplier['email']}'),
                  Text('Address: ${supplier['address']}'),
                ],
              ),
              trailing: Text(
                supplier['status'],
                style: TextStyle(
                  color: _statusColor(supplier['status']),
                  fontWeight: FontWeight.bold,
                ),
              ),
              isThreeLine: true,
              onTap: () {
                // Optional: Navigate to supplier detail/edit page
              },
            ),
          );
        },
      ),
    );
  }
}
