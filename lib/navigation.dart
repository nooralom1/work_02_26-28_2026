// ignore_for_file: unused_field, deprecated_member_use, unnecessary_string_interpolations
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:work_02_2026/feature/home/presentation/home_screen.dart';
import 'package:work_02_2026/gen/assets.gen.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/helper_methods.dart';

final class NavigationScreen extends StatefulWidget {
  final int? pageNum;

  const NavigationScreen({super.key, this.pageNum});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List _screens = [
    const HomeScreen(),
    const Center(child: Text("Profile")),
  ];
  int _currentIndex = 0;
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
        body: _screens[_currentIndex],
        bottomNavigationBar: SizedBox(
          height: 70.h,
          child: CustomNavigationBar(
            iconSize: 24.r,
            strokeColor: AppColors.primaryColor,
            backgroundColor: AppColors.cFFFFFF,
            items: [
              CustomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.home,
                  color: _currentIndex == 0
                      ? AppColors.primaryColor
                      : Colors.grey,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: _currentIndex == 0
                        ? AppColors.primaryColor
                        : Colors.grey,
                    fontSize: 14.sp,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.10.w,
                  ),
                ),
              ),
              CustomNavigationBarItem(
                icon: SvgPicture.asset(
                  Assets.icons.profile,
                  color: _currentIndex == 2
                      ? AppColors.primaryColor
                      : Colors.grey,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(
                    color: _currentIndex == 2
                        ? AppColors.primaryColor
                        : Colors.grey,
                    fontSize: 14.sp,
                    fontFamily: 'Public Sans',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
