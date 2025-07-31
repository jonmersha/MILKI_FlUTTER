import 'package:flutter/material.dart';

class ProductLinesPage extends StatelessWidget {
  const ProductLinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Lines')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.category, size: 64, color: Colors.deepOrange),
            ),
            const SizedBox(height: 16),
            const Text(
              '📦 What Are Product Lines?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Product lines represent groups of related food items offered in the store. Organizing products into lines helps with categorization, pricing, inventory tracking, and reporting.',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 32),
            const Text(
              '🗂️ Common Product Line Categories',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 2,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.lunch_dining, color: Colors.teal),
                    title: Text('Ready-to-Eat Meals'),
                    subtitle: Text(
                      'Packaged meals, lunch combos, and pre-cooked dishes.',
                    ),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.local_grocery_store,
                      color: Colors.brown,
                    ),
                    title: Text('Grocery Items'),
                    subtitle: Text(
                      'Rice, flour, grains, spices, and household staples.',
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.icecream, color: Colors.pink),
                    title: Text('Frozen Foods'),
                    subtitle: Text(
                      'Ice cream, frozen meat, and ready-made frozen items.',
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.liquor, color: Colors.indigo),
                    title: Text('Beverages'),
                    subtitle: Text(
                      'Soft drinks, water, juice, and energy drinks.',
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.eco, color: Colors.green),
                    title: Text('Organic Products'),
                    subtitle: Text('Fresh produce and organic food items.'),
                  ),
                ],
              ),
            ),
            const Divider(height: 32),
            const Text(
              '📊 Benefits of Organizing by Product Line',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              '✓ Improved inventory management\n'
              '✓ Better sales and demand analysis\n'
              '✓ Simplified reordering from suppliers\n'
              '✓ Clear categorization for customers and staff\n'
              '✓ Accurate pricing and reporting by category',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 32),
            const Text(
              '⚙️ Managing Product Lines in the App',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Use the app to add, edit, or archive product lines. Each line can be associated with individual products, suppliers, and stock levels. Navigate to the inventory module to assign products to a line.',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 32),
            const Text(
              '🧾 Example Product Line Breakdown',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              color: Colors.grey.shade50,
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Text(
                      'Product Line: "Frozen Foods"\n'
                      '- Products: Chicken Wings, Sausages, Fries\n'
                      '- Supplier: ColdChain Distributors\n'
                      '- Stock Alert: < 50 Units\n'
                      '- Shelf Life: 6 months\n'
                      '- Storage: -18°C',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
