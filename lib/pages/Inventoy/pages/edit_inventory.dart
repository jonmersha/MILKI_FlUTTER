import 'package:flutter/material.dart';
import 'package:milkifoodcomplex/core/services/api_service.dart';

class AddEditInventoryDialog extends StatefulWidget {
  final Map<String, dynamic> item;

  const AddEditInventoryDialog({super.key, required this.item});

  @override
  State<AddEditInventoryDialog> createState() => _AddEditInventoryDialogState();
}

class _AddEditInventoryDialogState extends State<AddEditInventoryDialog> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  late TextEditingController _codeController;
  late TextEditingController _productNameController;
  late TextEditingController _quantityController;
  late TextEditingController _unitController;
  late String storeName;

  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    isEdit = widget.item.containsKey('id');
    storeName = widget.item['store_name'] ?? '';

    _codeController = TextEditingController(text: widget.item['code'] ?? '');
    _productNameController = TextEditingController(
      text: widget.item['product_name'] ?? '',
    );
    _quantityController = TextEditingController(
      text: widget.item['quantity']?.toString() ?? '',
    );
    _unitController = TextEditingController(text: widget.item['unit'] ?? '');
  }

  @override
  void dispose() {
    _codeController.dispose();
    _productNameController.dispose();
    _quantityController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final data = {
      'code': _codeController.text,
      'product_name': _productNameController.text,
      'quantity': int.tryParse(_quantityController.text) ?? 0,
      'unit': _unitController.text,
      'store_name': storeName,
    };

    try {
      if (isEdit) {
        await _apiService.postData(20, widget.item['id'], data);
      } else {
        await _apiService.postData(20, widget.item['id'], data);
      }
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'Edit Inventory' : 'Add Inventory')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Store: $storeName",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _codeController,
                decoration: const InputDecoration(labelText: 'Code'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _productNameController,
                decoration: const InputDecoration(labelText: 'Product Name'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _quantityController,
                decoration: const InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: _unitController,
                decoration: const InputDecoration(labelText: 'Unit'),
                validator:
                    (value) =>
                        value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text(isEdit ? 'Update' : 'Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
