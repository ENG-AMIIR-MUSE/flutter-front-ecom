import 'dart:developer';
import 'package:ecomerce_final/baseUrl.dart';
import 'package:ecomerce_final/components/message.dart';
import 'package:ecomerce_final/controllers/cart_controller.dart';
import 'package:ecomerce_final/models/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
// Add this import for custom toast messages

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var loadingProductId = ''.obs;
  final CartController cartController =
      Get.find(); // Add this line to get the cart controller

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = Uri.parse('${Baseurl.url}products');
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
      final List<dynamic> data = jsonDecode(response.body);
      log("data $data");
      
      try {
        products.value = data.map((json) {
          try {
            return Product.fromJson(json);
          } catch (e) {
            log('Error parsing individual product: $e');
            log('Problematic JSON: $json');
            return null;
          }
        }).whereType<Product>().toList();  // This will filter out any null values
        
        log('Products fetched successfully: ${products.length} products loaded');
      } catch (e) {
        log('Error mapping products: $e');
      }
    } else {
      log('Failed to load products: ${response.body}');
    }
    } catch (e) {
      log('Error fetching products: $e');
    } finally {
      isLoading(false);
    }
  }

  void addToCart(String productId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = await prefs.getString('token');
    final url = Uri.parse('${Baseurl.url}cart/add');
    try {
      loadingProductId(productId);
      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'productId': productId, 'quantity': 1}),
      );
      log(response.body);
      if (response.statusCode == 200) {
        log('Product added to cart successfully');
        final product =
            products.firstWhere((product) => product.id == productId);
        cartController.addToCart(product); // Notify the cart controller
        showCustomSnackBar(
          title: 'Success',
          message: 'Product added to cart!',
          isSuccess: true,
        );
      } else {
        log('Failed to add product to cart: ${response.body}');
        showCustomSnackBar(
          title: 'Error',
          message: 'Failed to add product to cart.',
          isSuccess: false,
        );
      }
    } catch (e) {
      log('Error adding product to cart: $e');
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
    } finally {
      loadingProductId('');
    }
  }
}
