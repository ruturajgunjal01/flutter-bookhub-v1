import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final BorderRadius? borderRadius;
  final TextStyle? hintStyle;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? bgColor;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final AutovalidateMode? autovalidateMode;
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.borderRadius,
    this.hintStyle,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.bgColor,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.autovalidateMode,
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
      style: const TextStyle(color: Colors.white, fontSize: 16),
      decoration: InputDecoration(
        hintText: widget.hintText ?? "Enter text",
        hintStyle: widget.hintStyle,
        filled: widget.bgColor != null,
        fillColor: widget.bgColor,
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(20),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
