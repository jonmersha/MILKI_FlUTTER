import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Food Complex App')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage(
                  'assets/logo.png',
                ), // Optional: Your app logo
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '📘 Application Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'This application is designed to help manage food complex store operations, including inventory tracking, product line organization, order and payment handling, and supplier management.',
              style: TextStyle(fontSize: 16),
            ),
            const Divider(height: 32),
            const Text(
              '✨ Key Features',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.dashboard, color: Colors.blue),
                    title: Text('Interactive Dashboard'),
                    subtitle: Text(
                      'View key store metrics such as stock levels, orders, and payments.',
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.inventory, color: Colors.green),
                    title: Text('Inventory Control'),
                    subtitle: Text(
                      'Real-time tracking of product stock and low-stock alerts.',
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.payment, color: Colors.purple),
                    title: Text('Payment Management'),
                    subtitle: Text(
                      'Manage expected payments, outstanding dues, and transaction history.',
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_shipping, color: Colors.orange),
                    title: Text('Supplier Coordination'),
                    subtitle: Text(
                      'Track and manage suppliers, delivery status, and communication.',
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.grey),
                    title: Text('Configurable Settings'),
                    subtitle: Text(
                      'Adjust application preferences and user permissions.',
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 32),
            const Text(
              '👨‍💻 Development Team',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('Yohannes Mitike'),
              subtitle: Text('Lead Developer & System Designer'),
            ),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('Project Team'),
              subtitle: Text('UI/UX, QA, and Support Engineers'),
            ),
            const Divider(height: 32),
            const Text(
              '🛠️ Technologies Used',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: const [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text('Firebase / REST API')),
                Chip(label: Text('SQLite')),
                Chip(label: Text('Provider / Riverpod')),
              ],
            ),
            const Divider(height: 32),
            const Text(
              '📞 Contact & Support',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'For help, bug reports, or feature requests, please contact: support@foodcomplexapp.com',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
