
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/wdigets/custom_container.dart';
import 'package:flutter/material.dart';

InkWell customBack(BuildContext context, {required VoidCallback onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: CustomContainer(
      width: 40,
      color: AppColors.light2,
      borderRadius: BorderRadius.all(Radius.circular(100)),
      height: 40,
      child: Center(
        child: Icon(Icons.arrow_back_ios_new_outlined),
      ),
    ),
  );
}
