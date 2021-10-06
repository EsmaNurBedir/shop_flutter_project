
import 'package:flutter/material.dart';
import 'package:shop_flutter_project/appColors/app_colors.dart';

class ShowAllWidget extends StatelessWidget {
  final String leftText;

   ShowAllWidget({this.leftText});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.baseBlackColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            "Show All",
            style: TextStyle(
              fontSize: 17,
              color: AppColors.baseDarkPinkColor,
            ),
          )
        ],
      ),
    );
  }
}