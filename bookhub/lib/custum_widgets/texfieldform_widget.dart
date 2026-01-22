import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utility/constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;
  final FocusNode? focusNode;
  
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.autovalidateMode,
    this.initialValue,
    this.focusNode,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines,
      focusNode: widget.focusNode,
      initialValue: widget.initialValue,
      style: TextStyle(color: AppColors.blacktextColor, fontSize: 14.sp),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: AppColors.lightGreyColor, fontSize: 14.sp),
        filled: true,
        fillColor: AppColors.whiteColor,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: AppColors.redErrorColor, width: 1.0),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
