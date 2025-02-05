import 'package:ecomerce_final/controllers/auth_controller.dart';
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/view/notification.dart';
import 'package:ecomerce_final/wdigets/custom_back.dart';
import 'package:ecomerce_final/wdigets/custom_button.dart';
import 'package:ecomerce_final/wdigets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final TextEditingController email = TextEditingController();
  final TextEditingController secretQuestion = TextEditingController();
  final TextEditingController secretAnswer = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  final _formKey = GlobalKey<FormState>();

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
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Form(
            key: _formKey,
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
                  controller: email,
                  hintText: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!GetUtils.isEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: secretQuestion,
                  hintText: "Secret Question",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your secret question';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  controller: secretAnswer,
                  hintText: "Secret Answer",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your secret answer';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: "Continue",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      authController.forgetPassword(
                        email: email.text,
                        secretQuestion: secretQuestion.text,
                        secretAnswer: secretAnswer.text,
                        context: context,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
