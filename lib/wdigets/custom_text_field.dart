import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final EdgeInsets contentPadding;
  final Color fillColor;
  final BorderRadius borderRadius;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool alignText;
  final Function(String)? onChanged;
  final IconData? leadingIcon;
  final String? Function(String?)? validator; // Add validator parameter

  const CustomTextField(
      {Key? key,
      this.hintText = '',
      this.isPassword = false,
      this.controller,
      this.keyboardType = TextInputType.text,
      this.contentPadding =
          const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      this.fillColor = const Color(0xffF4F4F4),
      this.borderRadius = const BorderRadius.all(Radius.circular(9)),
      this.textStyle,
      this.hintStyle,
      this.onChanged,
      this.alignText = false,
      this.leadingIcon,
      this.validator}) // Pass the validator as an optional parameter
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword; // Initialize for password fields
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _isObscured,
      textAlign: widget.alignText ? TextAlign.center : TextAlign.left,
      onChanged: widget.onChanged,
      validator: widget.validator, // Add validator to the TextFormField
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textFieldColor,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.grey),
        contentPadding: widget.contentPadding,
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: BorderSide.none,
        ),
        prefixIcon: widget.leadingIcon != null
            ? Icon(widget.leadingIcon) // Add the leading icon if provided
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
      ),
      style: widget.textStyle ??
          const TextStyle(fontSize: 16, color: Colors.black),
    );
  }
}
