
import 'package:ecomerce_final/core/constants/app_colors.dart';
import 'package:ecomerce_final/core/constants/text_styles.dart';
import 'package:ecomerce_final/view/home.dart';
import 'package:ecomerce_final/wdigets/custom_button.dart';
import 'package:ecomerce_final/wdigets/custom_container.dart';
import 'package:flutter/material.dart';

class AboutYourSelf extends StatefulWidget {
  const AboutYourSelf({super.key});

  @override
  State<AboutYourSelf> createState() => _AboutYourSelfState();
}

bool isMen = false;
bool isWomen = false;

void changeStateForMen() {
  isMen = !isMen;
  isWomen = false;
}

void changeStateForWomen() {
  isWomen = !isWomen;
  isMen = false;
}

List<String> list = ["5-10", "10-20", "20-30", "30-40"];
String? selectedValue;

class _AboutYourSelfState extends State<AboutYourSelf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "About Your Self",
                    style: TextStyles.mainStyle,
                  ),
                  SizedBox(
                    height: 49,
                  ),
                  Text(
                    "What Do You Shop For ?",
                    style: TextStyles.mainStyle
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            changeStateForWomen();
                            setState(() {});
                          },
                          child: CustomContainer(
                              height: 56,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: isWomen
                                  ? AppColors.primary
                                  : AppColors.textFieldColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Women",
                                    style: TextStyles.mainStyle.copyWith(
                                        fontSize: 18,
                                        color: isWomen
                                            ? AppColors.whiteTextColor
                                            : AppColors.dark1),
                                  )
                                ],
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            changeStateForMen();
                            setState(() {});
                          },
                          child: CustomContainer(
                              height: 56,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              color: isMen
                                  ? AppColors.primary
                                  : AppColors.textFieldColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Men",
                                    style: TextStyles.mainStyle.copyWith(
                                      fontSize: 18,
                                      color: isMen
                                          ? AppColors.whiteTextColor
                                          : AppColors.dark1,
                                    ),
                                  )
                                ],
                              )),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 56,
                  ),
                  Text(
                    "How Old Are You  ?",
                    style: TextStyles.mainStyle
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  CustomContainer(
                    color: AppColors.textFieldColor,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    width: 400, // Set the desired width
                    height: 56, // Set the desired height
                    padding: EdgeInsets.symmetric(horizontal: 12),

                    child: DropdownButtonHideUnderline(
                      // Removes the default underline
                      child: DropdownButton<String>(
                        value: selectedValue,
                        hint: Text(
                          "Select an age range",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        items: list.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black), // Item text style
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        dropdownColor:
                            Colors.white, // Dropdown menu background color
                        icon: Icon(Icons.arrow_drop_down,
                            color: AppColors.dark1, size: 24),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: CustomButton(
                text: "Finish",
                onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
              ),
            )
          ],
        ));
  }
}
