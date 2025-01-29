import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar({
  required String title,
  required String message,
  bool isSuccess = true,
}) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: isSuccess ? Colors.green[50] : Colors.red[50],
    colorText: isSuccess ? Colors.green : Colors.red,
  );
}
