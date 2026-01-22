import 'dart:convert';
import 'package:bookhub/utility/constant_data.dart';
import 'package:bookhub/utility/app_routes.dart';
import 'package:bookhub/utility/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static final AuthController _instance = AuthController._internal();
  factory AuthController() => _instance;
  AuthController._internal();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController userAgeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController schoolUniController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  int selectedUserType = 0; 

  void dispose() {
    firstNameController.dispose();
    userAgeController.dispose();
    phoneController.dispose();
    emailController.dispose();
    locationController.dispose();
    schoolUniController.dispose();
    passwordController.dispose();
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppString.nameIsRequired;
    }
    return null;
  }

  String? validateUserAge(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppString.ageIsRequired;
    }
    if (int.tryParse(value) == null) {
      return AppString.enterValidNumber;
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppString.phoneIsRequired;
    }

    if (value.length < 10) {
      return AppString.enterValidPhone;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return AppString.emailIsRequired;
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return AppString.enterValidEmail;
    return null;
  }

  String? validateLocation(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppString.locationIsRequired;
    }
    return null;
  }

  bool validateSignUpForm() => signUpFormKey.currentState?.validate() ?? false;

  String _getProfessionFromType(int type) {
    switch (type) {
      case 0:
        return "Student";
      case 1:
        return "College";
      case 2:
        return "Individual";
      default:
        return "Other";
    }
  }

  String get _baseUrl {
    return ApiPath.baseUrl;
  }

  Future<void> signUp(BuildContext context) async {
    final url = Uri.parse('$_baseUrl${ApiPath.signUp}');

    final body = json.encode({
      "user_full_name": firstNameController.text.trim(),
      "user_age": int.tryParse(userAgeController.text.trim()) ?? 0,
      "user_phone_number": phoneController.text.trim(),
      "user_email_address": emailController.text.trim(),
      "user_location": locationController.text.trim(),
      "user_school_university": schoolUniController.text.trim(),
      "user_profession": _getProfessionFromType(selectedUserType),
    });

    try {
      final response = await http.post(
        url,
        body: body,
        headers: {"Content-Type": "application/json"},
      );

      // Handle response...
      // Note: The specific backend response structure depends on your API.
      // Adjust keys ['message'], ['data'], etc. accordingly.

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        showSnackBar(context, "Account created successfully!", Colors.green);

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('userEmail', emailController.text.trim());
        await prefs.setString('userName', firstNameController.text.trim());

        // if (responseData['data'] != null && responseData['data']['id'] != null) {
        //   await prefs.setString('userId', responseData['data']['id'].toString());
        // }

        // Navigate to next screen (SignIn or Home)
        context.go(AppRoutes.homeScreen);
      } else {
        showSnackBar(
          context,
          responseData['message'] ?? 'Signup failed.',
          Colors.red,
        );
      }
    } catch (e) {
      showSnackBar(context, 'Error: $e', Colors.red);
    }
  }

  Future<void> signIn(BuildContext context, {required bool isPhone}) async {
    Uri.parse('$_baseUrl${ApiPath.signIn}');
    json.encode({
      "email": emailController.text.trim(), 
    });

    try {
      await Future.delayed(const Duration(seconds: 1));
      showSnackBar(
        context,
        "Sign In logic pending implementation",
        Colors.blue,
      );
    } catch (e) {
      showSnackBar(context, 'Error: $e', Colors.red);
    }
  }

  void showSnackBar(BuildContext context, String message, Color color) {
    if (!context.mounted) return;

    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
