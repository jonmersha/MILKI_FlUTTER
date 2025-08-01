import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/core/services/api_service.dart';

class FactoryCreatePage extends StatefulWidget {
  const FactoryCreatePage({super.key});

  @override
  State<FactoryCreatePage> createState() => _FactoryCreatePageState();
}

class _FactoryCreatePageState extends State<FactoryCreatePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _locationController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isSubmitting = false;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isSubmitting = true);

      // ✅ Wrap the payload in a list
      List<Map<String, dynamic>> payload = [
        {
          'name': _nameController.text.trim(),
          'location': _locationController.text.trim(),
        },
      ];

      bool success = await _apiService.postData(3, payload, {});

      setState(() => _isSubmitting = false);

      if (success) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Factory created successfully')),
          );
          Navigator.pop(context);
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to create factory')),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Factory')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Factory Name'),
                validator:
                    (value) => value!.isEmpty ? 'Enter factory name' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) => value!.isEmpty ? 'Enter location' : null,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isSubmitting ? null : _submitForm,
                child:
                    _isSubmitting
                        ? const CircularProgressIndicator()
                        : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
