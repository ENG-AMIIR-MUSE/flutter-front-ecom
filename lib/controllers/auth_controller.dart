import 'dart:developer';

import 'package:ecomerce_final/baseUrl.dart';
import 'package:ecomerce_final/components/message.dart';
import 'package:ecomerce_final/models/user.dart';
import 'package:ecomerce_final/view/home.dart';
import 'package:ecomerce_final/view/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var user = User().obs;

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    log("Calling========================LOGIN");
    final url = Uri.parse('${Baseurl.url}auth/login');
    log("Parsed url $url");
    try {
      log("executed try block");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}),
      );
      final responseBody = jsonDecode(response.body);

      log(responseBody['message']);
      if (response.statusCode == 200) {
        // Store token
        log("response code ${responseBody['data']}");
        await prefs.setString('token', responseBody['data']['token']);
        // Handle successful login
        await fetchUserData();
        showCustomSnackBar(
          title: 'Success',
          message: 'You logged in successfully!',
          isSuccess: true,
        );
        log('You logged successfully');
        Get.offAll(() => Home());
      } else {
        // Handle login error
        final errorResponse = jsonDecode(response.body);
        log('error response: ${errorResponse["message"]}');

        showCustomSnackBar(
          title: 'Error',
          message: errorResponse["message"],
          isSuccess: false,
        );
        log('else');
      }
    } catch (e) {
      // Handle network or other errors
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
      log('Login error: $e');
    }
  }

  void register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phone,
      required BuildContext context}) async {
    final url = Uri.parse('${Baseurl.url}auth/register');
    log("Parsed url $url");
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
          'phone': phone,
        }),
      );
      final responseBody = jsonDecode(response.body);

      log("response code ${response.statusCode}");
      log(responseBody['message']);
      if (response.statusCode == 201) {
        // Handle successful registration
        showCustomSnackBar(
          title: 'Success',
          message: 'You registered successfully!',
          isSuccess: true,
        );
        log('You registered successfully');

        Get.to(() => SignUP());
        return;
      }
      // Handle registration error
      final errorResponse = jsonDecode(response.body);
      log('error response: ${errorResponse["message"]}');

      showCustomSnackBar(
        title: 'Error',
        message: errorResponse["message"],
        isSuccess: false,
      );
      log('else');
    } catch (e) {
      // Handle network or other errors
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
      log('Registration error: $e');
    }
  }

  Future<void> fetchUserData() async {
    final url = Uri.parse('${Baseurl.url}profile/me');
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final token = prefs.getString('token');
    log("my token [][][][][][][] $token");
    try {
      final response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      log("user response data${response.body}");
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final data = responseBody['data'];
        user.update((val) {
          val?.firstName = data['first_name'];
          val?.lastName = data['last_name'];
          val?.email = data['email'];
          val?.phone = data['phone'];
        });
        log('User data fetched successfully');
      } else {
        log('Failed to fetch user data');
      }
    } catch (e) {
      log('Error fetching user data: $e');
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString('token');
    final url = Uri.parse('${Baseurl.url}auth/logout');
    try {
      final response = await http.post(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );
      if (response.statusCode == 200) {
        await prefs.remove('token');
        Get.offAll(() => SignUP());
        showCustomSnackBar(
          title: 'Success',
          message: 'You logged out successfully!',
          isSuccess: true,
        );
      } else {
        log('Failed to log out');
        showCustomSnackBar(
          title: 'Error',
          message: 'Failed to log out. Please try again.',
          isSuccess: false,
        );
      }
    } catch (e) {
      log('Error logging out: $e');
      showCustomSnackBar(
        title: 'Error',
        message: 'An error occurred. Please try again.',
        isSuccess: false,
      );
    }
  }
}
