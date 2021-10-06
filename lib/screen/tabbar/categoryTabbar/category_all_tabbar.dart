
import 'package:flutter/material.dart';
import 'package:shop_flutter_project/data/homePageData/home_page_data.dart';
import 'package:shop_flutter_project/models/single_product_model.dart';
import 'package:shop_flutter_project/routes/routes.dart';
import 'package:shop_flutter_project/screen/detailScreen/detail_screen.dart';
import 'package:shop_flutter_project/widgets/show_all_widget.dart';
import 'package:shop_flutter_project/widgets/singleproduct_widget.dart';

class CategoryAllTabBar extends StatelessWidget {
  Widget builderRender({List<SingleProductModel> singleProduct}) {
    return Container(
      height: 250,
      child: GridView.builder(
        itemCount: singleProduct.length,
        shrinkWrap: true,
        primary: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 1.4,
        ),
        itemBuilder: (context, index) {
          var data = singleProduct[index];
          return SingleProductWidget(
            onPressed: () {
              PageRouting.goToNextPage(
                  navigateTo: DetailScreen(data: data), context: context);
            },
            productImage: data.productImage,
            productModel: data.productModel,
            productName: data.productName,
            productOldPrice: data.productOldPrice.toDouble(),
            productPrice: data.productPrice.toDouble(),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        ShowAllWidget(
          leftText: "Clothing",
        ),
        builderRender(singleProduct: colothsData),
        ShowAllWidget(
          leftText: "Shoes",
        ),
        builderRender(
          singleProduct: shoesData,
        ),
        ShowAllWidget(
          leftText: "Accessories",
        ),
        builderRender(
          singleProduct: accessoriesData,
        ),
      ],
    );
  }
}