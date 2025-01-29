
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/view/create_accout.dart';
import 'package:ecomerce_final/wdigets/custom_back.dart';
import 'package:ecomerce_final/wdigets/custom_button.dart';
import 'package:ecomerce_final/wdigets/custom_text_field.dart';
import 'package:ecomerce_final/wdigets/row_child.dart';

import 'package:flutter/material.dart';

class SignPassword extends StatelessWidget {
  SignPassword({super.key});

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
              const SizedBox(height: 100),
              const Text("Sign in", style: TextStyles.mainStyle),
              const SizedBox(height: 32),
              CustomTextField(
                controller: txt,
                isPassword: true,
                hintText: "Password",
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: "Continue",
                onPressed: () {
                  // Perform action on button press
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateAccount()));
                },
              ),
              const SizedBox(height: 16),
              rowChild(txt1: "Forget Password ? ", txt2: "Resest"),
            ],
          ),
        ),
      ),
    );
  }
}
