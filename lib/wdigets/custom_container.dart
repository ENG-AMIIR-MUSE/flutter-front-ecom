import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Color color;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final BoxShadow? boxShadow;

  const CustomContainer({
    Key? key,
    required this.child, // Child widget inside the container
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color = Colors.white, // Default background color
    this.borderRadius,
    this.border,
    this.boxShadow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(8.0), // Default radius
        border: border,
        boxShadow: boxShadow != null ? [boxShadow!] : null,
      ),
      child: child,
    );
  }
}
