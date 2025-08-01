import 'package:flutter/material.dart';

class StoreManagementPage extends StatelessWidget {
  const StoreManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Store Management')),
      body: const Center(child: Text('Manage store details here.')),
    );
  }
}
