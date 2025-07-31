class Product {
  final String id;
  final String name;
  final int quantity;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      category: json['category'],
    );
  }
}
