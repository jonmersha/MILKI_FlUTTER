import 'package:flutter/material.dart';

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Stock Information',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildStockCard(
                  title: 'Total Products',
                  value: '120',
                  icon: Icons.inventory_2_outlined,
                  color: Colors.teal,
                ),
                const SizedBox(width: 20),
                _buildStockCard(
                  title: 'Out of Stock',
                  value: '8',
                  icon: Icons.warning_amber_rounded,
                  color: Colors.redAccent,
                ),
                const SizedBox(width: 20),
                _buildStockCard(
                  title: 'Low Stock',
                  value: '15',
                  icon: Icons.info_outline,
                  color: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              'Stock Details',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder:
                    (_, index) => Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.fastfood),
                        title: Text('Product ${index + 1}'),
                        subtitle: const Text('Category: Main Dish'),
                        trailing: const Text('Qty: 25'),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(title, style: TextStyle(color: color)),
          ],
        ),
      ),
    );
  }
}
