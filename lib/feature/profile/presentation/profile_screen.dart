// ignore_for_file: unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:work_02_2026/constants/app_constants.dart';
import 'package:work_02_2026/feature/profile/widget/information.dart';
import 'package:work_02_2026/feature/profile/widget/login_page.dart';
import 'package:work_02_2026/feature/profile/widget/logout_button.dart';
import 'package:work_02_2026/feature/profile/widget/top_bar_data.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/di.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';
import 'package:work_02_2026/networks/api_access.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    getOwnProfileRxOBJ.getOwnProfileRx();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: !appData.read(kKeyIsLoggedIn)
          ? AppColors.primaryColor.withValues(alpha: 0.8)
          : Color(0xffF2F5FF),
      body: appData.read(kKeyIsLoggedIn)
          ? StreamBuilder(
              stream: getOwnProfileRxOBJ.dataFetcher,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitChasingDots(color: AppColors.primaryColor),
                  );
                }
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (snapshot.hasData) {
                  final data = snapshot.data;
                  return Column(
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

                                ////////////////////------- Top data ---------//////////////
                                Center(
                                  child: TopBarData(
                                    image:
                                        "https://cdn-icons-png.freepik.com/512/10337/10337609.png",
                                    name:
                                        "${data?.name?.firstname} ${data?.name?.lastname}",
                                  ),
                                ),
                                UIHelper.verticalSpace(24.h),

                                ////////////////////------- User Details Text ---------//////////////
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

                                ////////////////////------- Email ---------//////////////
                                Information(
                                  title: 'Email:',
                                  value: data?.email ?? "",
                                ),

                                ////////////////////------- Phone ---------//////////////
                                Information(
                                  title: 'Phone:',
                                  value: data?.phone ?? "",
                                ),
                                UIHelper.verticalSpace(12.h),

                                ////////////////////------- Address Text ---------//////////////
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

                                ////////////////////------- City Street ---------//////////////
                                Row(
                                  children: [
                                    Expanded(
                                      child: Information(
                                        title: 'City:',
                                        value: data?.address?.city ?? "",
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(8.w),
                                    Expanded(
                                      child: Information(
                                        title: 'Street:',
                                        value: data?.address?.street ?? "",
                                      ),
                                    ),
                                  ],
                                ),

                                ////////////////////------- Number ZipCode ---------//////////////
                                Row(
                                  children: [
                                    Expanded(
                                      child: Information(
                                        title: 'Number:',
                                        value: "${data?.address?.number}",
                                      ),
                                    ),
                                    UIHelper.horizontalSpace(8.w),
                                    Expanded(
                                      child: Information(
                                        title: 'ZipCode:',
                                        value: data?.address?.zipcode ?? "",
                                      ),
                                    ),
                                  ],
                                ),
                                UIHelper.verticalSpace(24.h),

                                ////////////////////------- LogOut Button ---------//////////////
                                LogOutButton(),
                                UIHelper.verticalSpace(24.h),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return const Center(child: Text("No Data Available"));
                }
              },
            )
          : LoginPage(),
    );
  }
}
