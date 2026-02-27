// ignore_for_file: unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/constants/app_constants.dart';
import 'package:work_02_2026/feature/profile/widget/information.dart';
import 'package:work_02_2026/feature/profile/widget/log_out_dialouge.dart';
import 'package:work_02_2026/feature/profile/widget/top_bar_data.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/all_routes.dart';
import 'package:work_02_2026/helpers/di.dart';
import 'package:work_02_2026/helpers/navigation_service.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appData.read(kKeyIsLoggedIn)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelper.verticalSpace(45.h),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          UIHelper.verticalSpace(8.h),
                          Center(
                            child: TopBarData(
                              image:
                                  "https://eduporibar.com/storage/backend/assets/uploaded-files/additional-feature-management/our-team/4125571771486693443.jpg",
                              name: 'Md Noor-Alom Siddik',
                            ),
                          ),
                          UIHelper.verticalSpace(24.h),
                          Text(
                            'User Details',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          UIHelper.verticalSpace(12.h),
                          Information(
                            title: 'Email:',
                            value: '110124092@itbd.com',
                          ),
                          Information(title: 'Phone:', value: '01707418534'),
                          UIHelper.verticalSpace(12.h),
                          Text(
                            'Address',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          UIHelper.verticalSpace(12.h),
                          Row(
                            children: [
                              Expanded(
                                child: Information(title: 'City:', value: 'IT'),
                              ),
                              UIHelper.horizontalSpace(8.w),
                              Expanded(
                                child: Information(
                                  title: 'Street:',
                                  value: 'App Developer',
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Information(
                                  title: 'Number:',
                                  value: 'B*',
                                ),
                              ),
                              UIHelper.horizontalSpace(8.w),
                              Expanded(
                                child: Information(
                                  title: 'ZipCode:',
                                  value: '2025-11-15',
                                ),
                              ),
                            ],
                          ),
                          UIHelper.verticalSpace(24.h),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return const LogOutDialouge();
                                },
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(12.sp),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Logout",
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 16.sp,
                                      fontFamily: 'Plus Jakarta Sans',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(
                                    Icons.login_outlined,
                                    color: AppColors.primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          UIHelper.verticalSpace(24.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      "এডু পরিবারের সাথে আপনার শিক্ষা জার্নি এগিয়ে যেতে এখনই লগইন করুন !",
                      style: TextStyle(
                        color: Colors.black.withValues(alpha: 0.8),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  UIHelper.verticalSpace(30.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 60.w),
                    child: GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(Routes.login);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.cFFFFFF,
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(width: 1.w, color: Colors.grey),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "লগইন করতে ক্লিক করুন",
                                  style: TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 16.sp,
                                    fontFamily: 'Public Sans',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                UIHelper.horizontalSpace(12.w),
                                Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
