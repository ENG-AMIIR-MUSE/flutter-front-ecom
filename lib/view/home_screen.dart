// import 'package:ecomerce_final/controllers/auth_controller.dart';
// import 'package:ecomerce_final/controllers/cart_controller.dart';
// import 'package:ecomerce_final/controllers/category_controller.dart';
// import 'package:ecomerce_final/controllers/product_controller.dart';
// import 'package:ecomerce_final/core/constants/app_colors.dart';
// import 'package:ecomerce_final/core/constants/text_styles.dart';
// import 'package:ecomerce_final/view/CategoryShimmer.dart';
// import 'package:ecomerce_final/view/categories.dart';
// import 'package:ecomerce_final/view/see_all.dart';
// import 'package:ecomerce_final/wdigets/card_contnet.dart';
// import 'package:ecomerce_final/wdigets/categories.dart';
// import 'package:ecomerce_final/wdigets/customAppbar.dart';
// import 'package:ecomerce_final/wdigets/custom_container.dart';
// import 'package:ecomerce_final/wdigets/custom_text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatefulWidget {
//   HomeScreen({Key? key}) : super(key: key);
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// @override
// void initState() {
//   CategoryController categoryController = Get.put(CategoryController());
//   ProductController productController = Get.put(ProductController());

//   categoryController.fetchCategories();
//   productController.fetchProducts();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final CategoryController categoryController = Get.put(CategoryController());

//   final AuthController authController =
//       Get.find();
//        final ProductController productController = Get.find();
//   final CartController cartController = Get.find(); // Ensure AuthController is initialized
//       @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     productController.fetchProducts();

//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 255, 255, 255),
//       body: SafeArea(
//           child: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             children: [
//               CustomHeader(),
//               SizedBox(
//                 height: 24,
//               ),
//               CustomContainer(
//                   width: 400,
//                   borderRadius: BorderRadius.all(Radius.circular(100)),
//                   child: CustomTextField(
//                     borderRadius: BorderRadius.all(Radius.circular(100)),
//                     leadingIcon: Icons.search_rounded,
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 13.0,
//                         horizontal: 15.0), // Adjust content padding
//                     hintText: "Search",
//                   )),
//               SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Categories ",
//                     style: TextStyles.mainStyle.copyWith(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => SeeAll()));
//                     },
//                     child: Text("See All",
//                         style: TextStyles.mainStyle.copyWith(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         )),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Obx(() {
//                 if (categoryController.categories.isEmpty) {
//                   return CategoryShimmer(); // Use shimmer instead of CircularProgressIndicator
//                 } else {
//                   return SizedBox(
//                     height: 80,
//                     child: ListView.builder(
//                       itemCount: categoryController.categories.length,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (context, index) {
//                         final category = categoryController.categories[index];
//                         return Categories(
//                             txt: category.name, imagePath: category.image);
//                       },
//                     ),
//                   );
//                 }
//               }),
//               SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Top Selling ",
//                     style: TextStyles.mainStyle.copyWith(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text("See All",
//                       style: TextStyles.mainStyle.copyWith(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 height: 32,
//               ),
//               Obx(() {
//                 if (productController.products.isEmpty) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   return CustomContainer(
//                       width: double.infinity,
//                       height: 281,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: productController.products.length,
//                         itemBuilder: (context, index) {
//                           final product = productController.products[index];
//                           return CardContent(product: product);
//                         },
//                       ));
//                 }
//               }),
//               SizedBox(
//                 height: 8,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "New ",
//                     style: TextStyles.mainStyle.copyWith(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.primary),
//                   ),
//                   Text("See All",
//                       style: TextStyles.mainStyle.copyWith(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                       )),
//                 ],
//               ),
//               SizedBox(
//                 height: 32,
//               ),
//               Obx(() {
//                 if (productController.products.isEmpty) {
//                   return Center(child: CircularProgressIndicator());
//                 } else {
//                   return CustomContainer(
//                       width: double.infinity,
//                       height: 281,
//                       child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: productController.products.length,
//                         itemBuilder: (context, index) {
//                           final product = productController.products[index];
//                           return CardContent(product: product);
//                         },
//                       ));
//                 }
//               }),
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
import 'package:ecomerce_final/controllers/auth_controller.dart';
import 'package:ecomerce_final/controllers/cart_controller.dart';
import 'package:ecomerce_final/controllers/category_controller.dart';
import 'package:ecomerce_final/controllers/product_controller.dart';
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/view/CategoryShimmer.dart';
import 'package:ecomerce_final/view/categories.dart';
import 'package:ecomerce_final/view/see_all.dart';
import 'package:ecomerce_final/wdigets/card_contnet.dart';
import 'package:ecomerce_final/wdigets/categories.dart';
import 'package:ecomerce_final/wdigets/customAppbar.dart';
import 'package:ecomerce_final/wdigets/custom_container.dart';
import 'package:ecomerce_final/wdigets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

@override
void initState() {
  CategoryController categoryController = Get.put(CategoryController());
  ProductController productController = Get.put(ProductController());

  categoryController.fetchCategories();
  productController.fetchProducts();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoryController categoryController = Get.put(CategoryController());

  final AuthController authController = Get.find();
  final ProductController productController = Get.find();
  final CartController cartController =
      Get.find(); // Ensure AuthController is initialized
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              CustomHeader(),
              SizedBox(
                height: 24,
              ),
              CustomContainer(
                  width: 400,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  child: CustomTextField(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    leadingIcon: Icons.search_rounded,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 13.0,
                        horizontal: 15.0), // Adjust content padding
                    hintText: "Search",
                  )),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories ",
                    style: TextStyles.mainStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SeeAll()));
                    },
                    child: Text("See All",
                        style: TextStyles.mainStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Obx(() {
                if (categoryController.categories.isEmpty) {
                  return CategoryShimmer(); // Use shimmer instead of CircularProgressIndicator
                } else {
                  return SizedBox(
                    height: 80,
                    child: ListView.builder(
                      itemCount: categoryController.categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = categoryController.categories[index];
                        return Categories(
                            txt: category.name, imagePath: category.image);
                      },
                    ),
                  );
                }
              }),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Selling ",
                    style: TextStyles.mainStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("See All",
                      style: TextStyles.mainStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Obx(() {
                if (productController.products.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return CustomContainer(
                      width: double.infinity,
                      height: 281,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.products.length,
                        itemBuilder: (context, index) {
                          final product = productController.products[index];
                          return CardContent(product: product);
                        },
                      ));
                }
              }),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New ",
                    style: TextStyles.mainStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary),
                  ),
                  Text("See All",
                      style: TextStyles.mainStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Obx(() {
                if (productController.products.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  // Filter products where pNew is true
                  final newProducts = productController.products
                      .where((product) => product.pNew)
                      .toList();
                  return CustomContainer(
                      width: double.infinity,
                      height: 281,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newProducts.length,
                        itemBuilder: (context, index) {
                          final product = newProducts[index];
                          return CardContent(product: product);
                        },
                      ));
                }
              }),
            ],
          ),
        ),
      )),
    );
  }
}
