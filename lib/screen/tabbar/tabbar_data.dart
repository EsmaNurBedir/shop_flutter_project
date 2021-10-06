import 'package:flutter/material.dart';
import 'package:shop_flutter_project/models/category_product_model.dart';
import 'package:shop_flutter_project/models/single_product_model.dart';
import 'package:shop_flutter_project/routes/routes.dart';
import 'package:shop_flutter_project/screen/detailScreen/detail_screen.dart';
import 'package:shop_flutter_project/widgets/singleproduct_widget.dart';

class TabBarBar extends StatelessWidget {
  final List<SingleProductModel> productData;
  final List<CategoryProductModel> categoryProductData;
  TabBarBar({@required this.productData, this.categoryProductData});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      itemCount: productData.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 0.7),
      itemBuilder: (context, index) {
        var data = productData[index];
        return SingleProductWidget(
          onPressed: () {
            PageRouting.goToNextPage(
              context: context,
              navigateTo: DetailScreen(data: data),
            );
          },
          productImage: data.productImage,
          productModel: data.productModel,
          productName: data.productName,
          productOldPrice: data.productOldPrice.toDouble(),
          productPrice: data.productPrice.toDouble(),
        );
      },
    );
  }
}