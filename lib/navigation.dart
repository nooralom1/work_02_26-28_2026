// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:work_02_2026/feature/home/presentation/home_screen.dart';
import 'package:work_02_2026/gen/assets.gen.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/helper_methods.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

final class NavigationScreen extends StatefulWidget {
  int? pageNum;
  NavigationScreen({super.key, this.pageNum});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    Center(child: Text("Profile")),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.pageNum ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) async {
        showMaterialDialog(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: _screens[_currentIndex],
        floatingActionButton: Container(
          width: 65.w,
          height: 65.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Colors.green, Colors.greenAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.icons.profile,
                color: AppColors.cFFFFFF,
                width: 13.w,
              ),
              UIHelper.verticalSpace(6.h),
              Text(
                "Check In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: 2,
          activeIndex: _currentIndex,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          height: 65.h,
          leftCornerRadius: 16.r,
          rightCornerRadius: 16.r,
          backgroundColor: Colors.white,
          shadow: BoxShadow(
            color: Colors.blue.withOpacity(0.2),
            blurRadius: 12,
            offset: Offset(0, -2),
          ),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          tabBuilder: (int index, bool isActive) {
            final svgList = [Assets.icons.home, Assets.icons.profile];

            final labels = ["Home", "Profile"];

            final color = isActive
                ? AppColors.primaryColor
                : Colors.grey.shade500;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              padding: EdgeInsets.symmetric(vertical: isActive ? 6 : 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedScale(
                    scale: isActive ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutBack,
                    child: SvgPicture.asset(
                      svgList[index],
                      height: 20.h,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                  UIHelper.verticalSpace(4.h),
                  Text(
                    labels[index],
                    style: TextStyle(
                      fontSize: isActive ? 12.sp : 11.sp,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      color: color,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
