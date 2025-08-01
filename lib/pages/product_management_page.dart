import 'package:flutter/material.dart';

class ProductManagementPage extends StatelessWidget {
  const ProductManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product Management')),
      body: const Center(child: Text('Manage products here.')),
    );
  }
}
