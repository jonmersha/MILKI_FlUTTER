import 'package:flutter/material.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage({super.key});

  // Example payments data (replace with real DB/API later)
  final List<Map<String, dynamic>> payments = const [
    {
      'id': 'PAY001',
      'payer': 'Abebe Kebede',
      'amount': 500.00,
      'method': 'Bank Transfer',
      'status': 'Pending',
      'date': '2025-07-28',
    },
    {
      'id': 'PAY002',
      'payer': 'Lily Tefera',
      'amount': 1240.50,
      'method': 'Cash',
      'status': 'Completed',
      'date': '2025-07-27',
    },
    {
      'id': 'PAY003',
      'payer': 'Tesfaye Lemma',
      'amount': 310.00,
      'method': 'Card',
      'status': 'Failed',
      'date': '2025-07-26',
    },
    {
      'id': 'PAY004',
      'payer': 'Sena Tulu',
      'amount': 980.00,
      'method': 'Cash',
      'status': 'Completed',
      'date': '2025-07-25',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payments')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: payments.length,
        itemBuilder: (context, index) {
          final payment = payments[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: Icon(
                Icons.payment,
                color: _getStatusColor(payment['status']),
              ),
              title: Text('Payment ID: ${payment['id']}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Payer: ${payment['payer']}'),
                  Text('Date: ${payment['date']}'),
                  Text('Method: ${payment['method']}'),
                  Text(
                    'Status: ${payment['status']}',
                    style: TextStyle(
                      color: _getStatusColor(payment['status']),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              trailing: Text(
                'ETB ${payment['amount'].toStringAsFixed(2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // Add optional payment detail navigation here
              },
            ),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'failed':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
