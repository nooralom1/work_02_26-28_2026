// ignore_for_file: deprecated_member_use

import 'package:cached_network_image_pro/cached_network_image_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';

class ProductViewContainer extends StatelessWidget {
  final String image;
  final String title;
  final String? discountPrice;
  final String price;
  final double rating;
  final int ratingCount;
  final void Function()? onTap;
  const ProductViewContainer({
    super.key,
    required this.image,
    required this.title,
    this.discountPrice,
    required this.price,
    this.onTap,
    required this.rating,
    required this.ratingCount,
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
          shape: RoundedRectangleBorder(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedNetworkImagePro(
              imgUrl: image,
              height: 150.h,
              width: double.infinity,
              boxfit: BoxFit.fill,
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
                      fontSize: 14.sp,
                      fontFamily: 'Public Sans',
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  UIHelper.verticalSpace(6.h),
                  Row(
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 16.sp,
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
                  UIHelper.verticalSpace(6.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orangeAccent),
                      UIHelper.horizontalSpace(4.w),
                      Text(
                        "$rating",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      UIHelper.horizontalSpace(6),
                      Text(
                        "($ratingCount)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
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
