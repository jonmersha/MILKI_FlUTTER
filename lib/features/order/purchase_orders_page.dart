import 'package:flutter/material.dart';

class PurchaseOrdersPage extends StatelessWidget {
  const PurchaseOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final purchaseOrders = [
      {
        'id': 'PO-2001',
        'supplier': 'Bahir Dar Foods Plc',
        'item': 'Tomato Paste',
        'quantity': 100,
        'unitCost': 22.0,
        'date': '2025-07-28',
      },
      {
        'id': 'PO-2002',
        'supplier': 'Addis Suppliers Ltd',
        'item': 'Wheat Flour',
        'quantity': 250,
        'unitCost': 14.5,
        'date': '2025-07-27',
      },
      {
        'id': 'PO-2003',
        'supplier': 'Selam Trading',
        'item': 'Sunflower Oil',
        'quantity': 180,
        'unitCost': 55.0,
        'date': '2025-07-26',
      },
      {
        'id': 'PO-2004',
        'supplier': 'EthioAgro',
        'item': 'Pasta',
        'quantity': 300,
        'unitCost': 17.5,
        'date': '2025-07-25',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Purchase Orders'),
        centerTitle: true,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Purchase Order List',
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
                    DataColumn(label: Text('PO ID')),
                    DataColumn(label: Text('Supplier')),
                    DataColumn(label: Text('Item')),
                    DataColumn(label: Text('Qty')),
                    DataColumn(label: Text('Unit Cost')),
                    DataColumn(label: Text('Total')),
                    DataColumn(label: Text('Date')),
                  ],
                  rows:
                      purchaseOrders.map((po) {
                        final total =
                            (po['quantity'] as int) *
                            (po['unitCost'] as double);
                        return DataRow(
                          cells: [
                            DataCell(Text(po['id'].toString())),
                            DataCell(Text(po['supplier'].toString())),
                            DataCell(Text(po['item'].toString())),
                            DataCell(Text(po['quantity'].toString())),
                            DataCell(Text('ETB ${po['unitCost']}')),
                            DataCell(Text('ETB ${total.toStringAsFixed(2)}')),
                            DataCell(Text(po['date'].toString())),
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
