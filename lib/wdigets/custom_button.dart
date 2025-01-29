import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double fontSize;
  final EdgeInsets padding;
  final FontWeight fontWeight;
  final double? width; // Optional width
  final double? height; // Optional height

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary, // Default blue color
    this.textColor = Colors.white,
    this.borderRadius = 100.0,
    this.fontSize = 16.0,
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
    this.fontWeight = FontWeight.bold,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 400,
      height: height ?? 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: padding,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ),
    );
  }
}
