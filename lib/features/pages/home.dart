import 'package:flutter/material.dart';

class HomeDashboardPage extends StatelessWidget {
  const HomeDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardItems = [
      DashboardItem('Orders', Icons.shopping_cart, Colors.indigo, '/orders'),
      DashboardItem('Payments', Icons.payment, Colors.green, '/payments'),
      DashboardItem(
        'Inventory',
        Icons.inventory,
        Colors.deepOrange,
        '/inventory',
      ),
      DashboardItem('Suppliers', Icons.people, Colors.purple, '/suppliers'),
      DashboardItem(
        'Registrations',
        Icons.app_registration,
        Colors.blueGrey,
        '/registrations',
      ),
      DashboardItem('Settings', Icons.settings, Colors.teal, '/settings'),
      DashboardItem('Reports', Icons.bar_chart, Colors.brown, '/reports'),
      DashboardItem(
        'Notifications',
        Icons.notifications,
        Colors.redAccent,
        '/notifications',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Home Dashboard')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = 2;
          if (constraints.maxWidth > 600) crossAxisCount = 3;
          if (constraints.maxWidth > 900) crossAxisCount = 4;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: GridView.builder(
              itemCount: dashboardItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1,
              ),
              itemBuilder: (context, index) {
                final item = dashboardItems[index];
                return DashboardCard(item: item);
              },
            ),
          );
        },
      ),
    );
  }
}

class DashboardItem {
  final String title;
  final IconData icon;
  final Color color;
  final String route;

  DashboardItem(this.title, this.icon, this.color, this.route);
}

class DashboardCard extends StatelessWidget {
  final DashboardItem item;

  const DashboardCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, item.route),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: item.color.withOpacity(0.1),
                radius: 30,
                child: Icon(item.icon, size: 30, color: item.color),
              ),
              const SizedBox(height: 12),
              Text(
                item.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
