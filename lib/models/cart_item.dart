import 'package:ecomerce_final/models/product.dart';

class CartItem {
  final String id;
  final Product product;
  final int quantity;

  CartItem({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['_id'] as String,
      product: Product.fromJson(json['product']),
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }
}
