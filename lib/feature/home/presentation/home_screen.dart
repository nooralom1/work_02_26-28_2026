// ignore_for_file: deprecated_member_use

import 'package:cached_network_image_pro/cached_network_image_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:work_02_2026/feature/home/widget/home_app_bar.dart';
import 'package:work_02_2026/feature/home/widget/product_view_container.dart';
import 'package:work_02_2026/feature/home/widget/slider.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';
import 'package:work_02_2026/networks/api_access.dart';
import 'package:work_02_2026/networks/endpoints.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  String convertToBanglaNumber(String number) {
    const eng = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const ban = ['০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'];

    for (int i = 0; i < eng.length; i++) {
      number = number.replaceAll(eng[i], ban[i]);
    }
    return number;
  }

  @override
  void initState() {
    allCourseListRxOBJ.allCourseListRx(pageNo: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////////////////////------- Home AppBar ---------//////////////
          HomeAppBar(),
          UIHelper.verticalSpace(8.h),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {},
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    UIHelper.verticalSpace(8.h),
                    ////////////////////------- Carousel Slider ---------//////////////
                    CustomSlider(
                      images: [
                        "https://img.lazcdn.com/us/domino/ddf2fd28-1f77-4f64-a835-c604a0ead328_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/5c57e4a0-653d-4fd7-8c97-e9f2be78ab39_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/c0a6dad0-dd04-45ed-976d-ac7bc9772c73_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/7ecb5f58-6828-4acc-9499-8150964e961a_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/5e41eccd-9a9b-4382-ade7-1c200caf2d89_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/947e8cb4-f12c-45be-9c47-c3dff4a6bf0f_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/c01197ea-7783-4f67-bd27-916914096f42_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/96cd8ecd-c1e6-42bc-b721-9bf5fdcda8a4_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/08f42997-6ea3-41b4-946b-e897dcbb4dc6_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/d99a3afc-785e-45b2-9125-9a9607bbe4f9_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                        "https://img.lazcdn.com/us/domino/02920c00-4ec2-415f-a71b-7865d6eed869_BD-1976-688.jpg_2200x2200q80.jpg_.avif",
                      ],
                      height: 120.h,
                      initialIndex: 0,
                    ),
                    CachedNetworkImagePro(
                      imgUrl:
                          "https://img.lazcdn.com/us/domino/0a575696-176e-4d80-b84f-aeeb57bb2162_BD-1188-140.gif_2200x2200q80.gif_.webp",
                      width: double.infinity,
                      height: 70.h,
                    ),
                    UIHelper.verticalSpace(16.h),
                    ////////////////////------- চলমান কোর্স সমূহ Text ---------//////////////
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        "চলমান কোর্স সমূহ",
                        style: TextStyle(
                          color: const Color(0xFF212B36),
                          fontSize: 16.sp,
                          fontFamily: 'Public Sans',
                          fontWeight: FontWeight.w600,
                          height: 1.56.h,
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),
                    ////////////////////------- চলমান কোর্স সমূহ List ---------//////////////
                    StreamBuilder(
                      stream: allCourseListRxOBJ.dataFetcher,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Column(
                            children: [
                              UIHelper.verticalSpace(100.h),
                              Center(
                                child: SpinKitChasingDots(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          );
                        }
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error: ${snapshot.error}"),
                          );
                        }
                        if (snapshot.hasData) {
                          final data = snapshot.data?.courses?.data;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 10.h,
                                        crossAxisSpacing: 10.w,
                                        childAspectRatio: 0.76,
                                      ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data!.length,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (_, index) {
                                    final course = data[index];
                                    final intPrice = double.parse(
                                      course.price.toString(),
                                    ).toInt();
                                    final intDiscountAmount = int.parse(
                                      course.discountAmount.toString(),
                                    ).toInt();
                                    final admissionLastDate = DateTime.parse(
                                      course.admissionLastDate ?? "",
                                    );
                                    final discountLastDate = DateTime.parse(
                                      course.discountEndDate ?? "",
                                    );
                                    int afterDiscount =
                                        intPrice - intDiscountAmount;
                                    return ProductViewContainer(
                                      image: course.banner != null
                                          ? imageUrl + course.banner!
                                          : "",
                                      title: course.title ?? "",
                                      discountPrice:
                                          discountLastDate.isAfter(
                                            DateTime.now(),
                                          )
                                          ? "৳ ${convertToBanglaNumber(course.price.toString())}"
                                          : "৳ 0",
                                      price:
                                          discountLastDate.isAfter(
                                            DateTime.now(),
                                          )
                                          ? "৳ ${convertToBanglaNumber(afterDiscount.toString())}"
                                          : "৳ ${convertToBanglaNumber(course.price.toString())}",
                                      btnText:
                                          course.isPaid == "1" &&
                                              course.courseEnrollStatus ==
                                                  "false" &&
                                              admissionLastDate.isAfter(
                                                DateTime.now(),
                                              )
                                          ? "কোর্সটি কিনুন"
                                          : course.courseEnrollStatus == "true"
                                          ? "ক্লাস করুন "
                                          : course.courseEnrollStatus ==
                                                "pending"
                                          ? "অপেক্ষা করুন"
                                          : course.isPaid == "0"
                                          ? "ফ্রী ক্লাস করুন "
                                          : "ভর্তির সময় শেষ",
                                      btnColor:
                                          course.isPaid == "1" &&
                                              course.courseEnrollStatus ==
                                                  "false" &&
                                              admissionLastDate.isAfter(
                                                DateTime.now(),
                                              )
                                          ? AppColors.primaryColor
                                          : course.courseEnrollStatus ==
                                                    "true" ||
                                                course.isPaid == "0"
                                          ? Colors.green
                                          : course.courseEnrollStatus ==
                                                "pending"
                                          ? Colors.blueGrey.withValues(
                                              alpha: 0.6,
                                            )
                                          : Colors.grey,
                                      onTap: () {},
                                      buyOnTap: () {},
                                    );
                                  },
                                ),
                              ),
                              UIHelper.verticalSpace(24.h),
                            ],
                          );
                        } else {
                          return const Center(child: Text("No Data Available"));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
