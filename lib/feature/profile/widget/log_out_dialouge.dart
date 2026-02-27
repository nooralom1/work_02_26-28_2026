import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:work_02_2026/constants/app_constants.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/all_routes.dart';
import 'package:work_02_2026/helpers/di.dart';
import 'package:work_02_2026/helpers/navigation_service.dart';
import 'package:work_02_2026/helpers/toast.dart';

class LogOutDialouge extends StatefulWidget {
  const LogOutDialouge({super.key});

  @override
  State<LogOutDialouge> createState() => _LogOutDialougeState();
}

class _LogOutDialougeState extends State<LogOutDialouge> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      backgroundColor: AppColors.cFFFFFF,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  'Log Out?',
                  style: TextStyle(
                    fontSize: 24.sp,
                    color: AppColors.c000000,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            _isLoading
                ? SpinKitChasingDots(color: AppColors.primaryColor)
                : Text(
                    'Are you sure want to Log out from your account?',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppColors.c000000,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      NavigationService.goBack;
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      side: const BorderSide(color: AppColors.primaryColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      await appData.write(kKeyIsLoggedIn, false);
                      await appData.write(kKeyAccessToken, '');
                      await Future.delayed(Duration(seconds: 1));
                      setState(() {
                        _isLoading = false;
                      });
                      ToastUtil.showShortToast("Logout successfully.");
                      NavigationService.goBack;
                      NavigationService.navigateToUntilReplacement(
                        Routes.login,
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: const Text(
                      'Confirm',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
