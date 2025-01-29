
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/wdigets/custom_back.dart';
import 'package:ecomerce_final/wdigets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SingleCategory extends StatelessWidget {
  const SingleCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: CustomContainer(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0, bottom: 16),
                    child: customBack(context, onPressed: () {
                      Navigator.pop(context);
                    }),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 24.0, bottom: 24),
                child: Row(
                  children: [
                    Text(
                      "Hoodies",
                      style: TextStyles.mainStyle.copyWith(fontSize: 19),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: MasonryGridView.builder(
              //     itemCount: 8,
              //     shrinkWrap: true,
              //     gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //     ),
              //     itemBuilder: (context, index) => CustomContainer(
              //       margin: EdgeInsets.only(left: 20, bottom: 20),
              //       width: MediaQuery.of(context).size.width * 0.5,
              //       color: AppColors.backgroundColor,
              //       child: CardContent(),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
