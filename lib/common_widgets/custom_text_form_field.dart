// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

class CommonTextFormField extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final double? height;
  final IconData? prefixIcon;
  final Widget? prefixIconWidget;
  final IconData? suffixIcon;
  final Widget? suffixIconWidget;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final double borderRadius;
  final VoidCallback? onSuffixIconTap;
  final String? iconpath;
  final int maxline;
  final int? minLines;
  final bool readOnly;
  final bool isBorder;
  final Color fillColor;
  final Color? borderColor;
  // final Color? textInputColor;
  final Color? focusBorderColor;
  final Color? cursorColor;
  final TextStyle? hintStyle;
  final TextStyle? textInputStyle;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final TextStyle? labelStyle;
  final void Function()? onTap;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  const CommonTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.borderRadius = 8.0,
    required this.isPrefixIcon,
    this.iconpath,
    this.onSuffixIconTap,
    this.readOnly = false,
    this.maxline = 1,
    this.isBorder = true,
    this.fillColor = AppColors.cFFFFFF,
    this.hintStyle,
    this.height,
    this.minLines,
    // this.textInputColor,
    this.textAlign,
    this.textInputStyle,
    this.focusBorderColor,
    this.cursorColor,
    this.textInputAction,
    this.borderColor,
    this.maxLength,
    this.labelStyle,
    this.onTap,
    this.contentPadding,
    this.focusNode,
    this.prefixIconWidget,
    this.suffixIconWidget,
    required this.isSuffixIcon,
    this.onFieldSubmitted,
  });

  @override
  _CommonTextFormFieldState createState() => _CommonTextFormFieldState();
}

class _CommonTextFormFieldState extends State<CommonTextFormField> {
  FocusNode? focusNode;
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode!.addListener(() {
      setState(() {
        isFocused = focusNode!.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: widget.onFieldSubmitted,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign ?? TextAlign.start,
      readOnly: widget.readOnly,
      maxLines: widget.maxline,
      minLines: widget.minLines,
      focusNode: focusNode,
      cursorColor: widget.cursorColor ?? AppColors.c000000,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      decoration: InputDecoration(
        contentPadding: widget.contentPadding,
        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        // floatingLabelAlignment: FloatingLabelAlignment.center,
        filled: true,
        fillColor: widget.fillColor,
        labelText: widget.labelText,
        hintText: widget.hintText,
        labelStyle:
            widget.labelStyle ??
            TextStyle(
              color: const Color(0xFF919EAB),
              fontSize: 12.sp,
              fontFamily: 'Public Sans',
              fontWeight: FontWeight.w400,
            ),
        hintStyle:
            widget.hintStyle ??
            TextStyle(
              color: const Color(0xFF919EAB),
              fontSize: 12.sp,
              fontFamily: 'Public Sans',
              fontWeight: FontWeight.w400,
            ),
        prefixIcon: widget.isPrefixIcon
            ? Icon(
                widget.prefixIcon,
                color: isFocused ? AppColors.primaryColor : Colors.grey,
              )
            : widget.prefixIconWidget,
        suffixIcon: widget.isSuffixIcon
            ? Icon(
                widget.suffixIcon,
                color: isFocused ? AppColors.primaryColor : Colors.grey,
              )
            : widget.suffixIconWidget,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: widget.isBorder == true
              ? BorderSide(
                  color: widget.borderColor ?? const Color(0x51919EAB),
                  width: 1.w,
                )
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.focusBorderColor ?? AppColors.primaryColor,
            width: 1.w, // Adjust the border width if needed
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(color: Colors.red),
        ),
        disabledBorder: InputBorder.none,
      ),
      style:
          widget.textInputStyle ??
          TextStyle(
            color: const Color(0xFF0C0310).withValues(alpha: 0.8),
            fontSize: 14.sp,
            fontFamily: 'Plus Jakarta Sans',
            fontWeight: FontWeight.w600,
          ),
      onTap: widget.onTap,
    );
  }
}
