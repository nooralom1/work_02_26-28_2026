import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

class Information extends StatelessWidget {
  final String title;
  final String value;
  const Information({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.6),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        UIHelper.verticalSpace(4.h),
        Container(
          padding: EdgeInsets.all(12.sp),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.cFFFFFF,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withValues(alpha: 0.2),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Text(
            value,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black.withValues(alpha: 0.8),
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        UIHelper.verticalSpace(12.h),
      ],
    );
  }
}
