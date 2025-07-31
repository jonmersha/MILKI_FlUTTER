// import 'package:flutter/material.dart';

// class Sidebar extends StatelessWidget {
//   final int selectedIndex;
//   final ValueChanged<int> onItemSelected;
//   final bool isCollapsed;
//   final VoidCallback onToggle;

//   Sidebar({
//     required this.selectedIndex,
//     required this.onItemSelected,
//     required this.isCollapsed,
//     required this.onToggle,
//   });

//   final List<_SidebarItem> _items = [
//     _SidebarItem('Dashboard', Icons.dashboard),
//     _SidebarItem('Stock', Icons.inventory),
//     _SidebarItem('Product Lines', Icons.category),
//     _SidebarItem('Orders', Icons.shopping_cart),
//     _SidebarItem('Payments', Icons.payment),
//     _SidebarItem('Suppliers', Icons.local_shipping),
//     _SidebarItem('Inventory', Icons.store),
//     _SidebarItem('Settings', Icons.settings),
//     _SidebarItem('About', Icons.info),
//     _SidebarItem('Reistrations', Icons.input),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: isCollapsed ? 70 : 220,
//       color: Colors.teal[900],
//       child: Column(
//         children: [
//           const SizedBox(height: 16),
//           IconButton(
//             icon: Icon(
//               isCollapsed ? Icons.arrow_right : Icons.arrow_left,
//               color: Colors.white,
//             ),
//             onPressed: onToggle,
//           ),
//           const Divider(color: Colors.white38),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _items.length,
//               itemBuilder: (_, index) {
//                 final item = _items[index];
//                 final selected = index == selectedIndex;
//                 return ListTile(
//                   leading: Icon(
//                     item.icon,
//                     color: selected ? Colors.white : Colors.white70,
//                   ),
//                   title:
//                       isCollapsed
//                           ? null
//                           : Text(
//                             item.title,
//                             style: TextStyle(
//                               color: selected ? Colors.white : Colors.white70,
//                             ),
//                           ),
//                   selected: selected,
//                   selectedTileColor: Colors.teal[700],
//                   onTap: () => onItemSelected(index),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SidebarItem {
//   final String title;
//   final IconData icon;
//   _SidebarItem(this.title, this.icon);
// }
