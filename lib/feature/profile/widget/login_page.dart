import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/all_routes.dart';
import 'package:work_02_2026/helpers/navigation_service.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 70.w),
        child: GestureDetector(
          onTap: () {
            NavigationService.navigateTo(Routes.login);
          },
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.cFFFFFF,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login / Signup",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  UIHelper.horizontalSpace(12.w),
                  Icon(Icons.arrow_forward, color: AppColors.primaryColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
