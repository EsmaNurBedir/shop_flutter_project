import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flutter_project/appColors/app_colors.dart';
import 'package:shop_flutter_project/models/single_product_model.dart';
import 'package:shop_flutter_project/routes/routes.dart';
import 'package:shop_flutter_project/screen/sizeGuide/size_guide_screen.dart';
import 'package:shop_flutter_project/screen/yourbag/your_bag_screen.dart';
import 'package:shop_flutter_project/stylies/detail_screen_stylies.dart';
import 'package:shop_flutter_project/svgImages/svg_images.dart';
import 'package:shop_flutter_project/widgets/drop_button_widget.dart';


class DetailScreen extends StatefulWidget {
  final SingleProductModel data;

  DetailScreen({this.data});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _ratingController;
  String _sizeController;

  PreferredSize buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Reebok",
          style: TextStyle(
            color: AppColors.baseBlackColor,
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              SvgImages.heart,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset(
              SvgImages.upload,
              color: AppColors.baseBlackColor,
              width: 35,
              semanticsLabel: "Fave",
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  buildListTile() {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(
          'assets/images/new-logo.png',
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.productName,
            overflow: TextOverflow.ellipsis,
            style: DetailScreenStylies.commpanyTitleStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productModel,
            style: DetailScreenStylies.productModelStyle,
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.data.productPrice.toString(),
            style: DetailScreenStylies.productPriceStyle,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            widget.data.productOldPrice.toString(),
            style: DetailScreenStylies.productOldPriceStyle,
          ),
        ],
      ),
    );
  }

  buildProductImages() {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              widget.data.productImage,
              fit: BoxFit.cover,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productSecondImage),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productThirdImage),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 15, top: 15),
                  child: Image.network(widget.data.productFourImage),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  buildColorsAndSize() {
    return Row(
      children: [
        Expanded(
          child: DropButton(
            hintText: "Color",
            item: ["red", "blue", "white", "black", "pink"],
            ratingController: _ratingController,
          ),
        ),
        Expanded(
          child: DropButton(
            hintText: "Size",
            item: ["25", "30", "35", "40", "45"],
            ratingController: _sizeController,
          ),
        )
      ],
    );
  }

  buildExpensionTileRow({String firstTitle, String secTitle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstTitle,
          // ".\t\tMaterial",
          style: TextStyle(
            fontSize: 18.60,
          ),
        ),
        Text(
          secTitle,
          // "84%\tnylon",
          style: TextStyle(
            fontSize: 18.60,
          ),
        ),
      ],
    );
  }

  buildExpensionTile() {
    return ExpansionTile(
      title: Text(
        "Description",
        style: DetailScreenStylies.descriptionTextStyle,
      ),
      children: [
        ListTile(
          title: Wrap(
            children: [
              Text(
                "this woman\'s tank top is designed to help you\nstay cool. it\'s made of stretchy and breathable\nfabric that moves heat away from your skin\n",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Column(
                children: [
                  buildExpensionTileRow(
                    firstTitle: '.\t\tMaterial',
                    secTitle: "84%\tnylon",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "16% elastance",
                        style: TextStyle(
                          fontSize: 18.60,
                        ),
                      ),
                    ],
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\tSize",
                    secTitle: "2XS,\tXS, \ts,\tM, \tL",
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\tGender",
                    secTitle: "Woman",
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\tProvince",
                    secTitle: "Balochistan",
                  ),
                  buildExpensionTileRow(
                    firstTitle: ".\t\tCountry",
                    secTitle: "Pakistan",
                  ),
                  MaterialButton(
                    height: 55,
                    elevation: 0,
                    child: Text(
                      "Size guide",
                      style: DetailScreenStylies.sizeGruideTextStyle,
                    ),
                    minWidth: double.infinity,
                    color: AppColors.basewhite60Color,
                    onPressed: () {
                      PageRouting.goToNextPage(
                        context: context,
                        navigateTo: SizeGuideScreen(),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  buildAddtoCart() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: MaterialButton(
        elevation: 0,
        height: 50,
        color: AppColors.baseDarkGreenColor,
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(5)),
        child: Text(
          "Add to Cart",
          style: DetailScreenStylies.buttonTextStyle,
        ),
        onPressed: () {
          PageRouting.goToNextPage(
            context: context,
            navigateTo: YourBagScreen(
            ),
          );
        },
      ),
    );
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          buildListTile(),
          buildProductImages(),
          buildColorsAndSize(),
          buildAddtoCart(),
          buildExpensionTile(),
        ],
      ),
    );
  }
}