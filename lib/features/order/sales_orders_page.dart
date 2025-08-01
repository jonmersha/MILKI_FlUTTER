import 'package:flutter/material.dart';

class SalesOrdersPage extends StatelessWidget {
  const SalesOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        'id': 'SO-1001',
        'customer': 'Alice Berhanu',
        'product': 'Tomato Sauce',
        'quantity': 12,
        'unitPrice': 25.0,
        'date': '2025-07-29',
      },
      {
        'id': 'SO-1002',
        'customer': 'Daniel Mulu',
        'product': 'Sunflower Oil',
        'quantity': 8,
        'unitPrice': 60.0,
        'date': '2025-07-28',
      },
      {
        'id': 'SO-1003',
        'customer': 'Hanna W.',
        'product': 'Pasta',
        'quantity': 20,
        'unitPrice': 15.5,
        'date': '2025-07-28',
      },
      {
        'id': 'SO-1004',
        'customer': 'Yared Tsegaye',
        'product': 'Wheat Flour',
        'quantity': 30,
        'unitPrice': 12.0,
        'date': '2025-07-27',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Orders'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sales Order List',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columnSpacing: 20,
                  horizontalMargin: 16,
                  columns: const [
                    DataColumn(label: Text('Order ID')),
                    DataColumn(label: Text('Customer')),
                    DataColumn(label: Text('Product')),
                    DataColumn(label: Text('Qty')),
                    DataColumn(label: Text('Unit Price')),
                    DataColumn(label: Text('Total')),
                    DataColumn(label: Text('Date')),
                  ],
                  rows:
                      orders.map((order) {
                        final total =
                            (order['quantity'] as int) *
                            (order['unitPrice'] as double);
                        return DataRow(
                          cells: [
                            DataCell(Text(order['id'].toString())),
                            DataCell(Text(order['customer'].toString())),
                            DataCell(Text(order['product'].toString())),
                            DataCell(Text(order['quantity'].toString())),
                            DataCell(Text('ETB ${order['unitPrice']}')),
                            DataCell(Text('ETB ${total.toStringAsFixed(2)}')),
                            DataCell(Text(order['date'].toString())),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
