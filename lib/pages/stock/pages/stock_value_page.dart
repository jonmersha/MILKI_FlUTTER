import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/core/services/api_service.dart';

class StockValuePage extends StatelessWidget {
  final ApiService _apiService = ApiService();

  StockValuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stock Value Summary')),
      body: FutureBuilder<List<dynamic>>(
        future: _apiService.getData(22),
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
                  'Qty: ${stock["quantity"]} • Avg Price: ${stock["avg_unit_price"]} • Value: ${stock["stock_value"]}',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
