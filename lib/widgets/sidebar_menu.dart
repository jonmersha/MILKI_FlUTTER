import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/pages/order/purchase_orders_page.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  bool isPurchasesExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Dashboard Menu',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),

          // Dashboard Home
          ListTile(
            leading: const Icon(Icons.dashboard),
            title: const Text('Overview'),
            onTap: () {
              Navigator.pushNamed(context, '/dashboard-overview');
            },
          ),

          // Purchases (Expandable Section)
          ExpansionTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Purchases'),
            children: [
              ListTile(
                leading: const Icon(Icons.file_copy),
                title: const Text('Purchase Orders'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PurchaseOrdersPage(),
                    ),
                  );
                },
              ),
              // You can add more submenus here
            ],
            initiallyExpanded: isPurchasesExpanded,
            onExpansionChanged: (value) {
              setState(() => isPurchasesExpanded = value);
            },
          ),

          // You can keep adding more sections (e.g., Sales, Inventory, etc.)
        ],
      ),
    );
  }
}
