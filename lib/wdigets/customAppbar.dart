import 'package:badges/badges.dart';
import 'package:ecomerce_final/controllers/auth_controller.dart';
import 'package:ecomerce_final/controllers/cart_controller.dart';
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/view/cart.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart'
    as badges; // Add this import for badges package with prefix

class CustomHeader extends StatefulWidget {
  CustomHeader({super.key});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  final AuthController authController = Get.find();

  final CartController cartController = Get.find();
  // Add this line to get the cart controller
  @override
  void initState() {
    // TODO: implement initState
    authController.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      // padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Leading Profile Image
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/user2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome,",
                      style: TextStyles.mainStyle.copyWith(fontSize: 12)),
                  Row(
                    children: [
                      Obx(() => Text(
                            authController.user.value.firstName,
                            style: TextStyles.mainStyle.copyWith(fontSize: 16),
                          )),
                      SizedBox(width: 5),
                      Obx(() => Text(
                            authController.user.value.lastName,
                            style: TextStyles.mainStyle.copyWith(fontSize: 16),
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // Title Dropdown

          // Shopping Bag Icon with Badge
          Obx(() => badges.Badge(
                position: BadgePosition.topEnd(top: -5, end: -5),
                badgeContent: Text(
                  cartController.cartItems.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(CartScreen());
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: AppColors.whiteTextColor,
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
