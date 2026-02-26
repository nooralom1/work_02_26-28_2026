// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/common_widgets/custom_text_form_field.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

class HomeAppBar extends StatelessWidget {
  final void Function()? notificationOnTap;
  const HomeAppBar({super.key, this.notificationOnTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryColor),
      child: Column(
        children: [
          UIHelper.verticalSpace(45.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              children: [
                Expanded(
                  child: CommonTextFormField(
                    isPrefixIcon: false,
                    isSuffixIcon: true,
                    suffixIcon: Icons.search,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 6.h,
                      horizontal: 12.w,
                    ),
                  ),
                ),
                UIHelper.horizontalSpace(8.h),
                Icon(
                  Icons.document_scanner_outlined,
                  color: AppColors.cFFFFFF,
                  size: 35.sp,
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(12.h),
        ],
      ),
    );
  }
}
