import 'dart:developer';

import 'package:ecomerce_final/baseUrl.dart';
import 'package:ecomerce_final/components/message.dart';
import 'package:ecomerce_final/models/cart_item.dart';
import 'package:ecomerce_final/models/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    fetchCartItems();
    super.onInit();
  }

  void fetchCartItems() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');
    final url = Uri.parse('${Baseurl.url}cart');
    try {
      isLoading(true);
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        log("after response success data ${response.body}");
        final List<dynamic> data = jsonDecode(response.body)['items'];
        log("data $data");
        cartItems.value = data.map((json) => CartItem.fromJson(json)).toList();
        log('Cart items fetched successfully');
      } else {
        log('Failed to load cart items: ${response.body}');
      }
    } catch (e) {
      log('Error fetching cart items: $e');
    } finally {
      isLoading(false);
    }
  }

  void incrementQuantity(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');
    final url = Uri.parse('${Baseurl.url}cart/increment');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'productId': productId}),
      );
      if (response.statusCode == 200) {
        fetchCartItems();
        showCustomSnackBar(
          title: 'Success',
          message: 'Product quantity incremented!',
          isSuccess: true,
        );
      } else {
        log('Failed to increment product quantity: ${response.body}');
        showCustomSnackBar(
          title: 'Error',
          message: 'Failed to increment product quantity.',
          isSuccess: false,
        );
      }
    } catch (e) {
      log('Error incrementing product quantity: $e');
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
    }
  }

  void decrementQuantity(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');
    final url = Uri.parse('${Baseurl.url}cart/decrement');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'productId': productId}),
      );
      if (response.statusCode == 200) {
        fetchCartItems();
        showCustomSnackBar(
          title: 'Success',
          message: 'Product quantity decremented!',
          isSuccess: true,
        );
      } else {
        log('Failed to decrement product quantity: ${response.body}');
        showCustomSnackBar(
          title: 'Error',
          message: 'Failed to decrement product quantity.',
          isSuccess: false,
        );
      }
    } catch (e) {
      log('Error decrementing product quantity: $e');
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
    }
  }

  void removeItem(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');
    final url = Uri.parse('${Baseurl.url}cart/remove');
    try {
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'productId': productId}),
      );
      if (response.statusCode == 200) {
        fetchCartItems();
        showCustomSnackBar(
          title: 'Success',
          message: 'Product removed from cart!',
          isSuccess: true,
        );
      } else {
        log('Failed to remove product from cart: ${response.body}');
        showCustomSnackBar(
          title: 'Error',
          message: 'Failed to remove product from cart.',
          isSuccess: false,
        );
      }
    } catch (e) {
      log('Error removing product from cart: $e');
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
    }
  }

  void addToCart(Product product) {
    cartItems.add(CartItem(product: product, quantity: 1, id: product.id));
  }
}
