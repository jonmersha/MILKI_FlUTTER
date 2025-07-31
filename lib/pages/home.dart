import 'package:flutter/material.dart';

class DashboardOverviewPage extends StatelessWidget {
  const DashboardOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWideScreen = constraints.maxWidth >= 800;

              final metricsSection = SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _MetricCard(
                      title: 'Total Sales',
                      value: 'ETB 1.2M',
                      icon: Icons.attach_money,
                      color: Colors.green,
                    ),
                    _MetricCard(
                      title: 'Active Products',
                      value: '132',
                      icon: Icons.inventory_2,
                      color: Colors.orange,
                    ),
                    _MetricCard(
                      title: 'Total Orders',
                      value: '890',
                      icon: Icons.shopping_cart,
                      color: Colors.blue,
                    ),
                    _MetricCard(
                      title: 'Pending Deliveries',
                      value: '27',
                      icon: Icons.local_shipping,
                      color: Colors.redAccent,
                    ),
                    _MetricCard(
                      title: 'Registered Stores',
                      value: '8',
                      icon: Icons.store,
                      color: Colors.purple,
                    ),
                  ],
                ),
              );

              final salesTrendSection = _SectionCard(
                title: 'Monthly Sales Trend',
                child: const Center(child: Text('Chart placeholder')),
              );

              final inventorySection = _SectionCard(
                title: 'Inventory Levels',
                child: const Center(child: Text('Chart placeholder')),
              );

              final recentSalesOrders = const _RecentActivityCard(
                title: 'Recent Sales Orders',
                activities: [
                  'Order #2345 - ETB 1200',
                  'Order #2344 - ETB 700',
                  'Order #2343 - ETB 890',
                  'Order #2342 - ETB 450',
                ],
              );

              final recentSupplierDeliveries = const _RecentActivityCard(
                title: 'Recent Supplier Deliveries',
                activities: [
                  'Supplier ABC - 200 units',
                  'Supplier XYZ - 150 units',
                  'Supplier LMN - 100 units',
                ],
              );

              if (isWideScreen) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dashboard Overview',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    metricsSection,
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  salesTrendSection,
                                  const SizedBox(height: 20),
                                  inventorySection,
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  recentSalesOrders,
                                  const SizedBox(height: 20),
                                  recentSupplierDeliveries,
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dashboard Overview',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      metricsSection,
                      const SizedBox(height: 20),
                      salesTrendSection,
                      const SizedBox(height: 20),
                      inventorySection,
                      const SizedBox(height: 20),
                      recentSalesOrders,
                      const SizedBox(height: 20),
                      recentSupplierDeliveries,
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: color.withOpacity(0.15),
                child: Icon(icon, color: color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 14)),
                    const SizedBox(height: 6),
                    Text(
                      value,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _SectionCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20),
            SizedBox(height: 200, child: child),
          ],
        ),
      ),
    );
  }
}

class _RecentActivityCard extends StatelessWidget {
  final String title;
  final List<String> activities;

  const _RecentActivityCard({required this.title, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activities.length,
              itemBuilder:
                  (_, i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      activities[i],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
