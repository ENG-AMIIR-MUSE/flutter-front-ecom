

import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/view/notification.dart';
import 'package:ecomerce_final/wdigets/custom_back.dart';
import 'package:ecomerce_final/wdigets/custom_button.dart';
import 'package:ecomerce_final/wdigets/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController txt = TextEditingController();
  final TextEditingController txt2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            automaticallyImplyLeading: false),
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          // Add scroll functionality
          padding: const EdgeInsets.symmetric(
              horizontal: 23.0), // Add horizontal padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBack(context, onPressed: () {
                Navigator.pop(context);
              }),
              const SizedBox(height: 20),
              const Text("Forget Password", style: TextStyles.mainStyle),
              const SizedBox(height: 32),
              CustomTextField(
                controller: txt,
                isPassword: true,
                hintText: "Password",
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  // Perform action on button press
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NotWidget()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
