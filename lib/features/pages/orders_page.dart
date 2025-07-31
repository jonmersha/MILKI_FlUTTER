import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  // Sample list of orders (you can replace this with real data from a database or API)
  final List<Map<String, dynamic>> sampleOrders = const [
    {
      'id': 'ORD001',
      'customer': 'Abebe Kebede',
      'status': 'Pending',
      'total': 520.00,
      'date': '2025-07-28',
    },
    {
      'id': 'ORD002',
      'customer': 'Lily Tefera',
      'status': 'Completed',
      'total': 1240.50,
      'date': '2025-07-27',
    },
    {
      'id': 'ORD003',
      'customer': 'Robel Mengistu',
      'status': 'Cancelled',
      'total': 310.00,
      'date': '2025-07-26',
    },
    {
      'id': 'ORD004',
      'customer': 'Sena Tulu',
      'status': 'Processing',
      'total': 980.00,
      'date': '2025-07-25',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: sampleOrders.length,
        itemBuilder: (context, index) {
          final order = sampleOrders[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _getStatusColor(order['status']),
                child: const Icon(Icons.shopping_bag, color: Colors.white),
              ),
              title: Text('Order ID: ${order['id']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Customer: ${order['customer']}'),
                  Text('Date: ${order['date']}'),
                  Text(
                    'Status: ${order['status']}',
                    style: TextStyle(
                      color: _getStatusColor(order['status']),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              trailing: Text(
                'ETB ${order['total'].toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Navigate to order detail (optional)
              },
            ),
          );
        },
      ),
    );
  }

  // Color coding for order status
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'cancelled':
        return Colors.red;
      case 'processing':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
