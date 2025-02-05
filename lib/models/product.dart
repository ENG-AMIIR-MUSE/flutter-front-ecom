import 'dart:ffi';

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String image;
  final bool pNew;
  final String category;
  final int stock;

  Product({
    required this.id,
    required this.pNew,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['_id'] as String,
      pNew: json['pNew'] as bool,
      name: json['name'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
      price: json['price'] as double,
      category: json['category'] as String,
      stock: json['stock'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'pNew': pNew,
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'stock': stock,
    };
  }
}
