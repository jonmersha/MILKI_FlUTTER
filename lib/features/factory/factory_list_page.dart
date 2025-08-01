// lib/features/factory/pages/factory_list_page.dart
import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/core/services/api_service.dart';
import 'package:milkifoodcomplex/utils/routes.dart';

class FactoryListPage extends StatefulWidget {
  const FactoryListPage({super.key});

  @override
  State<FactoryListPage> createState() => _FactoryListPageState();
}

class _FactoryListPageState extends State<FactoryListPage> {
  final ApiService _apiService = ApiService();
  late Future<List<Map<String, dynamic>>> _factoriesFuture;

  @override
  void initState() {
    super.initState();
    _factoriesFuture = _loadFactories();
  }

  Future<List<Map<String, dynamic>>> _loadFactories() async {
    try {
      final rawData = await _apiService.getData(
        3,
      ); // assuming index 0 = factories
      // Ensure each item is a Map<String, dynamic>
      return List<Map<String, dynamic>>.from(rawData);
    } catch (e) {
      debugPrint('Error fetching factories: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Factory List')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _factoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No factories found.'));
          }

          final factories = snapshot.data!;
          return ListView.builder(
            itemCount: factories.length,
            itemBuilder: (context, index) {
              final factory = factories[index];
              final name = factory['name'] ?? 'No name';
              final location = factory['location'] ?? 'Unknown';
              final owner = factory['owner'] ?? 'Unknown';

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Location: $location'),
                      Text('Owner: $owner'),
                    ],
                  ),
                  onTap: () {
                    // Navigate to detail/edit if needed
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.factoryCreate).then((_) {
            setState(() {
              _factoriesFuture = _loadFactories();
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
