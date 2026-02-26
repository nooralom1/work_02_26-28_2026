import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/common_widgets/custom_text_form_field.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController? searchController;
  const HomeAppBar({super.key, this.searchController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      title: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CommonTextFormField(
                  controller: searchController,
                  height: 40.h,
                  isPrefixIcon: false,
                  isSuffixIcon: true,
                  suffixIcon: Icons.search,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 4.h,
                    horizontal: 12.w,
                  ),
                ),
              ),
              UIHelper.horizontalSpace(8.w),
              Icon(
                Icons.document_scanner_outlined,
                color: AppColors.cFFFFFF,
                size: 35.sp,
              ),
            ],
          ),
          UIHelper.verticalSpace(12.h),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
