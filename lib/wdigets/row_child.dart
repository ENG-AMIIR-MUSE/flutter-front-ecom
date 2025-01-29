import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

Row rowChild(
    {required String txt1, required String txt2, bool between = false}) {
  return Row(
    mainAxisAlignment:
        between ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
    children: [
      Text(
        "$txt1",
        style: TextStyles.mainStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
      Text(
        "$txt2",
        style: TextStyles.mainStyle.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
