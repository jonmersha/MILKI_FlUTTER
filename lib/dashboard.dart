import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/pages/factory/factory_list_page.dart';
import 'package:milkifoodcomplex/pages/order/purchase_orders_page.dart';
import 'package:milkifoodcomplex/pages/order/sales_orders_page.dart';
import 'package:milkifoodcomplex/pages/stock/pages/stock_by_store_page.dart';
import 'package:milkifoodcomplex/pages/stock/pages/stock_value_page.dart';
import 'package:milkifoodcomplex/pages/stock/pages/total_stock_page.dart';

// Import the separate DashboardOverviewPage
import 'pages/home.dart';

class DashboardHome extends StatefulWidget {
  const DashboardHome({super.key});

  @override
  State<DashboardHome> createState() => _DashboardHomeState();
}

class _DashboardHomeState extends State<DashboardHome> {
  bool isMenuExpanded = true;

  int? expandedMenuIndex;
  final Map<int, int> selectedSubMenuIndices = {};

  final List<MenuItem> menuItems = [
    MenuItem(
      icon: Icons.dashboard,
      label: 'Dashboard',
      subMenus: [
        // Use the separate page here
        SubMenu(label: 'Overview', widget: const DashboardOverviewPage()),
        SubMenu(
          label: 'Stats',
          widget: const Center(child: Text('Dashboard Stats')),
        ),
      ],
    ),
    MenuItem(
      icon: Icons.shop,
      label: 'Stock',
      subMenus: [
        SubMenu(label: 'stock by store', widget: StockByStorePage()),
        SubMenu(
          label: 'Total stock by product across all stores',
          widget: TotalStockPage(),
        ),
        SubMenu(label: 'Stock value summary', widget: StockValuePage()),
      ],
    ),
    MenuItem(
      icon: Icons.store,
      label: 'Stores',
      subMenus: [
        SubMenu(
          label: 'Store List',
          widget: const Center(child: Text('Store List Page')),
        ),
        SubMenu(
          label: 'Store Transfers',
          widget: const Center(child: Text('Store Transfers Page')),
        ),
      ],
    ),
    MenuItem(
      icon: Icons.shopping_cart,
      label: 'Orders',
      subMenus: [
        SubMenu(label: 'Sales Orders', widget: const PurchaseOrdersPage()),
        SubMenu(label: 'Purchase Orders', widget: const SalesOrdersPage()),
      ],
    ),
    MenuItem(
      icon: Icons.inventory,
      label: 'Inventory',
      subMenus: [
        SubMenu(label: 'Stock In/Out', widget: StockByStorePage()),
        SubMenu(
          label: 'Processing',
          widget: const Center(child: Text('Processing Page')),
        ),
      ],
    ),
    MenuItem(
      icon: Icons.group,
      label: 'Suppliers',
      subMenus: [
        SubMenu(
          label: 'Supplier List',
          widget: const Center(child: Text('Supplier List Page')),
        ),
        SubMenu(
          label: 'Add Supplier',
          widget: const Center(child: Text('Add Supplier Page')),
        ),
      ],
    ),
    MenuItem(
      icon: Icons.settings,
      label: 'Settings',
      subMenus: [
        SubMenu(
          label: 'User Settings',
          widget: const Center(child: Text('User Settings Page')),
        ),
        SubMenu(
          label: 'System Settings',
          widget: const Center(child: Text('System Settings Page')),
        ),
        SubMenu(label: 'Factory List', widget: const FactoryListPage()),

        //FactoryListPage
      ],
    ),
  ];

  Widget? selectedPage;

  @override
  void initState() {
    super.initState();
    expandedMenuIndex = 0;
    selectedSubMenuIndices[0] = 0;
    selectedPage = menuItems[0].subMenus[0].widget;
  }

  void onMainMenuTap(int mainIndex) {
    setState(() {
      if (expandedMenuIndex == mainIndex) {
        expandedMenuIndex = null;
      } else {
        expandedMenuIndex = mainIndex;
        selectedSubMenuIndices.putIfAbsent(mainIndex, () => 0);
        selectedPage =
            menuItems[mainIndex]
                .subMenus[selectedSubMenuIndices[mainIndex]!]
                .widget;
      }
    });
  }

  void onSubMenuTap(int mainIndex, int subIndex) {
    setState(() {
      selectedSubMenuIndices[mainIndex] = subIndex;
      selectedPage = menuItems[mainIndex].subMenus[subIndex].widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 21, 29, 51),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Refresh logic can be added here
            },
          ),
        ],
      ),
      body: Row(
        children: [
          // Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: isMenuExpanded ? 250 : 70,
            color: Colors.blueGrey[900],
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    isMenuExpanded ? Icons.chevron_left : Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      isMenuExpanded = !isMenuExpanded;
                      if (!isMenuExpanded) expandedMenuIndex = null;
                    });
                  },
                ),
                const Divider(color: Colors.white30),
                Expanded(
                  child: ListView.builder(
                    itemCount: menuItems.length,
                    itemBuilder: (context, mainIndex) {
                      final menu = menuItems[mainIndex];
                      final bool isExpanded = expandedMenuIndex == mainIndex;
                      final bool hasSubMenus = menu.subMenus.isNotEmpty;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Icon(menu.icon, color: Colors.white),
                            title:
                                isMenuExpanded
                                    ? Text(
                                      menu.label,
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                    : null,
                            trailing:
                                isMenuExpanded && hasSubMenus
                                    ? Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_down
                                          : Icons.keyboard_arrow_right,
                                      color: Colors.white70,
                                    )
                                    : null,
                            selected: mainIndex == expandedMenuIndex,
                            selectedTileColor: Colors.blueGrey[700],
                            onTap: () => onMainMenuTap(mainIndex),
                          ),
                          if (isExpanded && isMenuExpanded)
                            ...List.generate(menu.subMenus.length, (subIndex) {
                              final isSelected =
                                  selectedSubMenuIndices[mainIndex] == subIndex;
                              return Padding(
                                padding: const EdgeInsets.only(left: 48),
                                child: ListTile(
                                  title: Text(
                                    menu.subMenus[subIndex].label,
                                    style: TextStyle(
                                      color:
                                          isSelected
                                              ? Colors.tealAccent
                                              : Colors.white70,
                                      fontWeight:
                                          isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                    ),
                                  ),
                                  onTap:
                                      () => onSubMenuTap(mainIndex, subIndex),
                                ),
                              );
                            }),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Content Area
          Expanded(
            child: Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.all(24),
              child: selectedPage ?? const Center(child: Text('Select a menu')),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem {
  final IconData icon;
  final String label;
  final List<SubMenu> subMenus;

  MenuItem({required this.icon, required this.label, required this.subMenus});
}

class SubMenu {
  final String label;
  final Widget widget;

  SubMenu({required this.label, required this.widget});
}
