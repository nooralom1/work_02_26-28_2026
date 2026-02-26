import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:work_02_2026/feature/home/model/product_list_model.dart';
import 'package:work_02_2026/feature/home/widget/product_view_container.dart';
import 'package:work_02_2026/gen/colors.gen.dart';
import 'package:work_02_2026/networks/api_access.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<List<ProductListModel>>(
      stream: productListRxOBJ.dataFetcher,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitChasingDots(color: AppColors.primaryColor),
          );
        }
        if (snapshot.hasError) {
          return Center(child: Text("Error"));
        }
        final data = snapshot.data ?? [];
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 0.6,
          ),
          itemCount: data.length,
          itemBuilder: (_, index) {
            final product = data[index];
            return ProductViewContainer(
              image: product.image ?? "",
              title: product.title ?? "",
              price: "\$ ${product.price}",
              discountPrice: "",
              rating: product.rating?.rate ?? 0.0,
              ratingCount: product.rating?.count ?? 0,
              onTap: () {},
            );
          },
        );
      },
    );
  }
}
