// ignore_for_file: deprecated_member_use

import 'package:cached_network_image_pro/cached_network_image_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/common_widgets/custom_button.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

class ProductViewContainer extends StatelessWidget {
  final String image;
  final String title;
  final String? discountPrice;
  final String price;
  final String? btnText;
  final Color? btnColor;
  final void Function()? onTap;
  final void Function()? buyOnTap;
  const ProductViewContainer({
    super.key,
    required this.image,
    required this.title,
    this.discountPrice,
    required this.price,
    this.onTap,
    this.buyOnTap,
    this.btnText,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9.r),
          ),
          shadows: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9.r),
                topRight: Radius.circular(9.r),
              ),
              child: CachedNetworkImagePro(
                imgUrl: image,
                height: 100.h,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpace(2.h),
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF161C24),
                      fontSize: 12.sp,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  UIHelper.verticalSpace(4.h),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: const Color(0xFF212B36),
                          fontSize: 12.sp,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      UIHelper.horizontalSpace(16.w),
                      if (discountPrice != "৳ 0.00" && discountPrice != "৳ 0")
                        Text(
                          discountPrice ?? "",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 10.sp,
                            fontFamily: 'Public Sans',
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                    ],
                  ),
                  UIHelper.verticalSpace(8.h),
                  CustomButton(
                    bgColor: btnColor,
                    onTap: buyOnTap ?? () {},
                    text: btnText ?? "",
                    verticalPadding: 6.h,
                    fontWeight: FontWeight.w400,
                  ),
                  UIHelper.verticalSpace(10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
