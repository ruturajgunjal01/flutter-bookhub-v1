import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidget extends StatefulWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final double? height;
  final dynamic textAlign;
  final List<Shadow>? shadows;

  const TextWidget({
    super.key,
    required this.text,
    this.backgroundColor,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.height,
    this.textAlign,
    this.shadows,
  });

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text ?? " ",
      maxLines: widget.maxLines,
      textAlign: widget.textAlign,
      style: GoogleFonts.baiJamjuree(
        backgroundColor: widget.backgroundColor,
        color: widget.color,
        fontSize: widget.fontSize?.sp,
        fontWeight: widget.fontWeight,
        height: widget.height?.h,
      ),
    );
  }
}
