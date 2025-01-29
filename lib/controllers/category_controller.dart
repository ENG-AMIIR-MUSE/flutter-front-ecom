import 'dart:developer';
import 'package:ecomerce_final/baseUrl.dart';
import 'package:ecomerce_final/models/category.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryController extends GetxController {
  var categories = <Category>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final url = Uri.parse('${Baseurl.url}categories');
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        log("after response success data ${response.body}");
        final List<dynamic> data = jsonDecode(response.body);
        log("dagta $data");
        categories.value = data.map((json) => Category.fromJson(json)).toList();
        log('Categories fetched successfully');
      } else {
        log('Failed to load categories');
      }
    } catch (e) {
      log('Error fetching categories: $e');
    }
  }
}
