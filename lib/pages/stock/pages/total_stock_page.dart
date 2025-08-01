import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/core/services/api_service.dart';

class TotalStockPage extends StatelessWidget {
  final ApiService _apiService = ApiService();

  TotalStockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Total Stock')),
      body: FutureBuilder<List<dynamic>>(
        future: _apiService.getData(21),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final stocks = snapshot.data!;
          return ListView.builder(
            itemCount: stocks.length,
            itemBuilder: (context, index) {
              final stock = stocks[index];
              return ListTile(
                title: Text('${stock["product_name"]}'),
                subtitle: Text(
                  'Code: ${stock["code"]} • Total Qty: ${stock["total_quantity"]}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
