
import 'package:flutter/material.dart';
import 'package:shop_flutter_project/appColors/app_colors.dart';
import 'package:shop_flutter_project/routes/routes.dart';
import 'package:shop_flutter_project/screen/confirmationSuccessPage/confirmation_success_page.dart';
import 'package:shop_flutter_project/widgets/my_button_widget.dart';

class ConfirmationPage extends StatelessWidget {
  AppBar buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
  Widget buildBottomPart(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: AppColors.baseGrey10Color,
          title: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order amount",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.baseBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Your total amount of discount",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.baseBlackColor,
                  ),
                ),
              ],
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "\$103.98",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.baseBlackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "\$-55.98",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.baseBlackColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: AppColors.baseGrey10Color,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 23),
          child: MyButtonWidget(
            color: AppColors.baseDarkPinkColor,
            text: "Place Order",
            onPress: () {
              PageRouting.goToNextPage(
                context: context,
                navigateTo: ConfirmationSuccessPage(),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildConfirmationProduct() {
    return Card(
      child: Container(
        height: 140,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/pembe.jpg"),
                            )),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "3 stripes shirt",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$ 40",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "adidas originals",
                                style: TextStyle(
                                  color: AppColors.baseDarkPinkColor,
                                ),
                              ),
                              Text(
                                "\$ 80",
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 16,
                                  color: AppColors.baseBlackColor,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Color:\tBlack",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.baseGrey60Color,
                            ),
                          ),
                          Text(
                            "Quantity:\tx1",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.baseGrey60Color,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      backgroundColor: AppColors.baseGrey10Color,
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            color: AppColors.baseWhiteColor,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Confirmation",
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.baseBlackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text("order number #123123213"),
                ),
                buildConfirmationProduct(),
                buildConfirmationProduct(),
                buildConfirmationProduct(),
                buildBottomPart(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}