import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flutter_project/appColors/app_colors.dart';
import 'package:shop_flutter_project/routes/routes.dart';
import 'package:shop_flutter_project/screen/homePage/home_page.dart';
import 'package:shop_flutter_project/svgImages/svg_images.dart';
import 'package:shop_flutter_project/widgets/my_button_widget.dart';


class ConfirmationSuccessPage extends StatelessWidget {
  AppBar buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        "Success",
        style: TextStyle(
          color: AppColors.baseBlackColor,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            SvgImages.close,
            width: 30,
            color: AppColors.baseBlackColor,
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Congratulations",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseBlackColor,
                          ),
                        ),
                        Text(
                          "Your order is accepted",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Your items are on the way",
                          style: TextStyle(
                            color: AppColors.baseGrey40Color,
                          ),
                        ),
                        Text(
                          "and should arrive shortly",
                          style: TextStyle(
                            color: AppColors.baseGrey40Color,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: MyButtonWidget(
              onPress: () {
                PageRouting.goToNextPage(
                  context: context,
                  navigateTo: HomePage(),
                );
              },
              text: "Back to Home",
              color: AppColors.baseDarkPinkColor,
            ),
          ),
        ],
      ),
    );
  }
}