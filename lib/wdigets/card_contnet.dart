import 'package:ecomerce_final/controllers/product_controller.dart';
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/models/product.dart';
import 'package:ecomerce_final/wdigets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardContent extends StatelessWidget {
  final Product product;
  final ProductController productController = Get.find();

  CardContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return CustomContainer(
        margin: EdgeInsets.only(right: 12),
        borderRadius: BorderRadius.all(Radius.circular(9)),
        width: 159,
        child: Column(
          children: [
            Stack(
              children: [
                CustomContainer(
                  child: Image.network(product.image),
                  color: AppColors.light2,
                  width: double.infinity,
                  height: 220,
                ),
                InkWell(
                  onTap: () {
                    productController.addToCart(product.id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 9.0, right: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        productController.loadingProductId.value == product.id
                            ? CircularProgressIndicator()
                            : Icon(Icons.favorite_border),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Row(
                    children: [
                      Container(
                        width: 100, // Set a specific width
                        child: Text(
                          product.name,
                          style: TextStyles.mainStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "\$${product.price}",
                        style: TextStyles.mainStyle.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "\$${(product.price + 15).toStringAsFixed(2)}",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
        color: AppColors.light2,
        height: 281,
      );
    });
  }
}
