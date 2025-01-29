import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

Row signOPtion({required IconData icon, required String txt}) {
  return Row(
    children: [
      Padding(padding: EdgeInsets.only(left: 17), child: Icon(icon)),
      Padding(
          padding: EdgeInsets.only(left: 53),
          child: Text(
            "$txt",
            style: TextStyles.mainStyle.copyWith(fontSize: 16),
          ))
    ],
  );
}
