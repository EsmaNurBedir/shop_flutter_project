import 'package:flutter/material.dart';
import 'package:shop_flutter_project/data/categoryData/category_data.dart';
import 'package:shop_flutter_project/data/homePageData/home_page_data.dart';
import 'package:shop_flutter_project/models/category_product_model.dart';
import 'package:shop_flutter_project/routes/routes.dart';
import 'package:shop_flutter_project/screen/category/sub_category.dart';
import 'package:shop_flutter_project/widgets/categorproduct_widget.dart';

// ignore: must_be_immutable
class CategoryMenTabBar extends StatelessWidget {
  List<CategoryProductModel> categoryProductModel = [];
  CategoryMenTabBar({
    this.categoryProductModel,
  });

  @override
  Widget build(BuildContext context) {
    var data;
    buildConditions(index) {
      if (index == 0) {
        PageRouting.goToNextPage(
          //fillClothData[index]
          navigateTo: SubCategory(
            productModel: data.productModel,
            productData: colothsData,
            productName: data.productName,
          ),
          context: context,
        );
      } else if (index == 1) {
       PageRouting.goToNextPage(
          //fillClothData[index]
          navigateTo: SubCategory(
            productModel: data.productModel,
            productData: colothsData,
            productName: data.productName,
          ),
          context: context,
        );
      } else if (index == 2) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            productModel: accessoriesData[index].productModel,
            productData: accessoriesData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      } else if (index == 3) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            productModel: accessoriesData[index].productModel,
            productData: accessoriesData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      } else if (index == 4) {
        PageRouting.goToNextPage(
          navigateTo: SubCategory(
            productModel: accessoriesData[index].productModel,
            productData: accessoriesData,
            productName: menCategoryData[index].productName,
          ),
          context: context,
        );
      }
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: categoryProductModel.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        data = categoryProductModel[index];
        return CategoryProductWidget(
          onPressed: () {
            buildConditions(index);
          },
          productImage: data.productImage,
          productModel: "${colothsData.length}\t${data.productModel}",
          productName: data.productName,
        );
      },
    );
  }
}