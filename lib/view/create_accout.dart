import 'package:ecomerce_final/controllers/auth_controller.dart';
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/view/forget_password.dart';
import 'package:ecomerce_final/wdigets/custom_back.dart';
import 'package:ecomerce_final/wdigets/custom_button.dart';
import 'package:ecomerce_final/wdigets/custom_text_field.dart';
import 'package:ecomerce_final/wdigets/row_child.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController secretQuestionController =
      TextEditingController();
  final TextEditingController secretAnswerController = TextEditingController();
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        automaticallyImplyLeading: false,
      ),
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
            const Text("Create Account ", style: TextStyles.mainStyle),
            const SizedBox(height: 32),
            CustomTextField(
              controller: firstNameController,
              hintText: "First Name",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: lastNameController,
              hintText: "Last Name",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: emailController,
              hintText: "Enter Email Address",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: passwordController,
              isPassword: true,
              hintText: "Password",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: phoneController,
              hintText: "Phone Number",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: secretQuestionController,
              hintText: "Secret Question",
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: secretAnswerController,
              hintText: "Secret Answer",
            ),
            const SizedBox(height: 40),
            CustomButton(
              text: "Continue",
              onPressed: () {
                authController.register(
                  firstName: firstNameController.text,
                  lastName: lastNameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  phone: phoneController.text,
                  secretQuestion: secretQuestionController.text,
                  secretAnswer: secretAnswerController.text,
                  context: context,
                );
              },
            ),
            const SizedBox(height: 40),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPassword()));
                },
                child: rowChild(txt1: "Forgot Password ? ", txt2: "Reset")),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
