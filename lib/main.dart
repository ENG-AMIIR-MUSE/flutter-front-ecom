import 'package:ecomerce_final/controllers/auth_controller.dart';
import 'package:ecomerce_final/controllers/cart_controller.dart';
import 'package:ecomerce_final/controllers/category_controller.dart';
import 'package:ecomerce_final/controllers/product_controller.dart';
import 'package:ecomerce_final/view/splast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  initControllers();
  runApp(const MainApp());
}

void initControllers() {
  // Initialize controllers using Get.put()
  // This makes them globally available throughout the app
  Get.put(AuthController(), permanent: true);
  Get.put(CartController(), permanent: true);
  Get.put(CategoryController(), permanent: true);
  Get.put(ProductController(), permanent: true);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fun App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      builder: (context, child) {
        return Scaffold(
          body: child,
        );
      },
    );
  }
}
