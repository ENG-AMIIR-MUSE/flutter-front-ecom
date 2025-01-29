
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/wdigets/custom_container.dart';
import 'package:flutter/material.dart';

CustomContainer Categories({required String txt, imagePath}) {
  return CustomContainer(
      child: Column(
    children: [
      CustomContainer(
        margin: EdgeInsets.symmetric(horizontal: 13),
        borderRadius: BorderRadius.all(Radius.circular(100)),
        width: 56,
        height: 56,
        color: AppColors.light2,
        child: CircleAvatar(backgroundImage: NetworkImage('$imagePath')),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        txt,
        style: TextStyles.mainStyle
            .copyWith(fontSize: 12, fontWeight: FontWeight.w400),
      )
    ],
  ));
}
