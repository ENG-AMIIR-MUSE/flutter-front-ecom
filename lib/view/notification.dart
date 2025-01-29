
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/view/sign_in.dart';
import 'package:ecomerce_final/wdigets/custom_button.dart';
import 'package:flutter/material.dart';

class NotWidget extends StatelessWidget {
  const NotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroundColor,
      ),
      backgroundColor: AppColors.backgroundColor,
      body:
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,

          Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/not.png'),
          SizedBox(
            height: 24,
          ),
          Text(
            textAlign: TextAlign.center,
            "We Sent You An Email To Reset  ",
            style: TextStyles.mainStyle.copyWith(fontSize: 24),
          ),
          Text(
            textAlign: TextAlign.center,
            "Your Password ",
            style: TextStyles.mainStyle.copyWith(fontSize: 24),
          ),
          SizedBox(
            height: 24,
          ),
          CustomButton(
              text: "Return To Login",
              fontSize: 14,
              fontWeight: FontWeight.normal,
              width: 159,
              height: 52,
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => SignUP()));
              })
        ],
      )),
    );
  }
}
