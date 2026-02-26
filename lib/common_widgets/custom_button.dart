import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:work_02_2026/gen/colors.gen.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color? borderColor;
  final Color? bgColor;
  final Color? textColor;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final FontWeight? fontWeight;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    this.borderColor,
    this.bgColor,
    this.textColor,
    this.borderRadius,
    this.verticalPadding,
    this.fontWeight,
    this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          border: Border.all(
            width: 1.w,
            color: borderColor ?? Colors.transparent,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: verticalPadding ?? 16.h,
            horizontal: horizontalPadding ?? 0,
          ),
          child: Center(
            child: Text(
              text.tr,
              style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: 14.sp,
                fontFamily: 'Public Sans',
                fontWeight: fontWeight ?? FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
