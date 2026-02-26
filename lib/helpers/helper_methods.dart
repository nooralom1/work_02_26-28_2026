// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/common_widgets/custom_button.dart';
import 'package:work_02_2026/constants/app_constants.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/di.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

Future<void> setInitValue() async {
  await appData.writeIfNull(kKeyIsLoggedIn, false);
  await appData.writeIfNull(isSubscribed.toString(), false);
  await appData.writeIfNull(kKeyIsFirstTime, true);

  var deviceInfo = DeviceInfoPlugin();
  if (Platform.isIOS) {
    var iosDeviceInfo = await deviceInfo.iosInfo;
  } else if (Platform.isAndroid) {
    var androidDeviceInfo = await deviceInfo.androidInfo;
  }
  await Future.delayed(const Duration(seconds: 2));
}

void showMaterialDialog(BuildContext context) {
  showDialog<bool>(
    context: context,
    builder: (context) => ClipRRect(
      child: AlertDialog(
        title: const Text(
          "Do you want to exit the app?",
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          UIHelper.verticalSpace(24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    verticalPadding: 12.h,
                    text: "No",
                    onTap: () {
                      Navigator.of(context).pop(false);
                    },
                    borderRadius: 30.r,
                  ),
                ),
                UIHelper.horizontalSpace(16.h),
                Expanded(
                  child: CustomButton(
                    verticalPadding: 12.h,
                    text: "Yes",
                    onTap: () {
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    borderRadius: 30.r,
                    borderColor: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpace(24.h),
        ],
      ),
    ),
  );
}

void rotation() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
