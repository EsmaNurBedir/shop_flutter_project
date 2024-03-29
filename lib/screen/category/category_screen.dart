

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flutter_project/appColors/app_colors.dart';
import 'package:shop_flutter_project/data/categoryData/category_data.dart';
import 'package:shop_flutter_project/screen/tabbar/categoryTabbar/category_all_tabbar.dart';
import 'package:shop_flutter_project/screen/tabbar/categoryTabbar/category_men_tabbar.dart';
import 'package:shop_flutter_project/stylies/category_screen_stylies.dart';
import 'package:shop_flutter_project/svgImages/svg_images.dart';


class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  get menCategoryData => null;

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Welcome",
        style: CategoryScreenStylies.categoryAppBarTitleStyle,
      ),
      actions: [
        RotationTransition(
          turns: AlwaysStoppedAnimation(90 / 360),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              SvgImages.filter,
              color: AppColors.baseBlackColor,
              width: 35,
            ),
          ),
        ),
        IconButton(
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 35,
          ),
          onPressed: () {},
        )
      ],
      bottom: TabBar(
        indicator: BoxDecoration(color: Colors.transparent),
        labelStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        automaticIndicatorColorAdjustment: false,
        tabs: [
          Text("All"),
          Text("Men"),
          Text("Woman"),
          Text("Kids"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.baseWhiteColor,
        appBar: buildAppBar(),
        body: TabBarView(
          children: [
            //All Place
            CategoryAllTabBar(),
            //Men  Place
            CategoryMenTabBar(
              categoryProductModel: menCategoryData,
            ),
            //woman Place
            CategoryMenTabBar(
              categoryProductModel: womenCategoryData,
            ),
            //Kids place
            CategoryMenTabBar(
              categoryProductModel: forKids,
            ),
          ],
        ),
      ),
    );
  }
}