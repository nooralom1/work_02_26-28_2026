import 'package:cached_network_image_pro/cached_network_image_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

class TopBarData extends StatelessWidget {
  final String image;
  final String name;
  const TopBarData({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(150.r),
          child: CachedNetworkImagePro(
            errorWidget: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 45.r,
              child: const Center(
                child: Icon(Icons.person, color: AppColors.cFFFFFF),
              ),
            ),
            imgUrl: image,
            width: 100.h,
            height: 100.h,
          ),
        ),
        UIHelper.verticalSpace(16.h),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black.withValues(alpha: 0.9),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
