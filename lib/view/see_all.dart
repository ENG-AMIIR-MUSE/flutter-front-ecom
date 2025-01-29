

import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/wdigets/custom_back.dart';
import 'package:ecomerce_final/wdigets/seeCategories.dart';
import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  SeeAll({super.key});

  final TextEditingController txt = TextEditingController();
  final TextEditingController txt2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customBack(context, onPressed: () {
              Navigator.pop(context);
            }),
            const SizedBox(height: 20),
            const Text("Shop By Categories ", style: TextStyles.mainStyle),
            const SizedBox(height: 32),
            // Directly use ListView inside the Column
            Expanded(
              child: ListView(
                children: [
                  seeCategories(txt: "Hoodies", ctx: context),
                  seeCategories(txt: "Jackets", ctx: context),
                  seeCategories(txt: "Shorts", ctx: context),
                  seeCategories(txt: "Shoes", ctx: context),
                  seeCategories(txt: "Bags", ctx: context),
                  seeCategories(txt: "Jeens", ctx: context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
