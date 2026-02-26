// ignore_for_file: deprecated_member_use

import 'package:cached_network_image_pro/cached_network_image_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:work_02_2026/feature/home/data/dummy_data/dummy_data.dart';
import 'package:work_02_2026/feature/home/widget/home_app_bar.dart';
import 'package:work_02_2026/feature/home/widget/product_list.dart';
import 'package:work_02_2026/feature/home/widget/slider.dart';
import 'package:work_02_2026/feature/home/widget/tab_bar_delegate.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/helpers/ui_helpers.dart';
import 'package:work_02_2026/networks/api_access.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController? searchController;

  Future<void> _refresh() async {
    productListRxOBJ.productListRx();
  }

  @override
  void initState() {
    productListRxOBJ.productListRx();
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ////////////////////------- Home AppBar ---------//////////////
      appBar: HomeAppBar(searchController: searchController),
      body: DefaultTabController(
        length: 3,
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                /////------------- Collapsible Header ------------///////
                SliverAppBar(
                  pinned: false,
                  floating: false,
                  expandedHeight: 250.h,
                  backgroundColor: Colors.white,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Column(
                      children: [
                        UIHelper.verticalSpace(24.h),

                        ////////////////////------- Carousel Slider ---------//////////////
                        CustomSlider(
                          images: sliderImages,
                          height: 120.h,
                          initialIndex: 0,
                        ),

                        ////////////////////------- Grand Image ---------//////////////
                        CachedNetworkImagePro(
                          imgUrl: grandImage,
                          width: double.infinity,
                          height: 70.h,
                          boxfit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                ),

                //////-------------- Sticky TabBar --------------////////
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TabBarDelegate(
                    TabBar(
                      controller: _tabController,
                      indicatorColor: AppColors.primaryColor,
                      labelColor: AppColors.primaryColor,
                      unselectedLabelColor: Colors.grey,

                      //////-------------- TabBar List --------------////////
                      tabs: const [
                        Tab(text: "All"),
                        Tab(text: "Electronics"),
                        Tab(text: "Clothes"),
                      ],
                    ),
                  ),
                ),
              ];
            },

            ////////////////////------- Product List ---------//////////////
            body: TabBarView(
              controller: _tabController,
              children: [ProductList(), ProductList(), ProductList()],
            ),
          ),
        ),
      ),
    );
  }
}
