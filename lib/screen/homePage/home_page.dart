import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_flutter_project/appColors/app_colors.dart';
import 'package:shop_flutter_project/data/homePageData/home_page_data.dart';
import 'package:shop_flutter_project/models/single_product_model.dart';
import 'package:shop_flutter_project/routes/routes.dart';
import 'package:shop_flutter_project/screen/detailScreen/detail_screen.dart';
import 'package:shop_flutter_project/screen/filtter/filtter_screen.dart';
import 'package:shop_flutter_project/screen/tabbar/tabbar_data.dart';
import 'package:shop_flutter_project/services/supabase_service.dart';
import 'package:shop_flutter_project/stylies/home_screen_stylies.dart';
import 'package:shop_flutter_project/svgImages/svg_images.dart';
import 'package:shop_flutter_project/widgets/show_all_widget.dart';
import 'package:shop_flutter_project/widgets/singleproduct_widget.dart';

class HomePage extends StatefulWidget {
  static SingleProductModel signleProductModel;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var singleProductModel = <SingleProductModel>[];


  @override
  void initState() {
    super.initState();
    getData();
  }
  getData()async{
    singleProductModel = await SupabaseServices().getSingleProductModel();
    setState(() {
      
    });
  } 
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      bottom: TabBar(
        labelPadding: EdgeInsets.symmetric(horizontal: 22),
        indicator: BoxDecoration(
          color: Colors.transparent,
        ),
        isScrollable: true,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelColor: AppColors.baseBlackColor,
        labelColor: AppColors.baseDarkPinkColor,
        tabs: [
          Text("All ${singleProductModel.length}"),
          Text("Clothing ${singleProductModel.length}"),
          Text("Shoes ${singleProductModel.length}"),
          Text("Accesories ${singleProductModel.length}"),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Welcome",
            style: HomeScreenStylies.appBarUpperTitleStylies,
          ),
          Text(
            "Shopping",
            style: HomeScreenStylies.appBarBottomTitleStylies,
          )
        ],
      ),
      actions: [
        IconButton(
          icon: RotationTransition(
            turns: AlwaysStoppedAnimation(90 / 360),
            child: SvgPicture.asset(
              SvgImages.filter,
              color: AppColors.baseBlackColor,
              width: 30,
            ),
          ),
          onPressed: () {
            PageRouting.goToNextPage(
              context: context,
              navigateTo: FilterScreen(),
            );
          },
        ),
        IconButton(
          icon: SvgPicture.asset(
            SvgImages.search,
            color: AppColors.baseBlackColor,
            width: 30,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget buildAdvertismentPlace() {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Container(
        height: 170,
        child: Carousel(
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(microseconds: 1000),
          showIndicator: false,
          images: [
            Container(
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://blog.creatopy.com/wp-content/uploads/2019/03/creative-advertising-and-pop-culture-pop-culture-ads.png"),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://blog.creatopy.com/wp-content/uploads/2018/05/advertisement-ideas-inspiration-advertising.png",
                  ),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTrendingProduct({
    String productImage,
    String productName,
    String productModel,
    double productPrice,
  }) {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 30, right: 20, bottom: 20),
      height: 65,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Material(
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(productImage),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    overflow: TextOverflow.ellipsis,
                    style: HomeScreenStylies.trendingProductNameStyle,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    productModel,
                    style: HomeScreenStylies.trendingProductModelStyle,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: MaterialButton(
              color: AppColors.baseLightPinkColor,
              elevation: 0,
              height: 45,
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(0.7),
              ),
              onPressed: () {},
              child: Text(
                "\$ $productPrice",
                style: HomeScreenStylies.trendingProductPriceStyle,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: buildAppBar(context),
        body: TabBarView(
          children: [
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                buildAdvertismentPlace(),
                ShowAllWidget(
                  leftText: "New Arrival",
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    primary: true,
                    itemCount: sigleProductData.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      var arrivalDataStore = sigleProductData[index];

                      return SingleProductWidget(
                        productImage: arrivalDataStore.productImage,
                        productModel: arrivalDataStore.productModel,
                        productName: arrivalDataStore.productName,
                        productOldPrice: arrivalDataStore.productOldPrice.toDouble(),
                        productPrice: arrivalDataStore.productPrice.toDouble(),
                        onPressed: () {
                          PageRouting.goToNextPage(
                            context: context,
                            navigateTo: DetailScreen(
                              data: arrivalDataStore
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(
                  indent: 16,
                  endIndent: 16,
                ),
                ShowAllWidget(
                  leftText: "What\'s trending",
                ),
                buildTrendingProduct(
                  productImage:
                      'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                buildTrendingProduct(
                  productImage:
                      'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                buildTrendingProduct(
                  productImage:
                      'https://assets.reebok.com/images/w_600,f_auto,q_auto/cd34290e1b57479399b3aae00137ab00_9366/Classics_Mesh_Tank_Top_White_FJ3179_01_standard.jpg',
                  productModel: 'Tank-tops',
                  productName: 'Classics mesh tank top',
                  productPrice: 15,
                ),
                ShowAllWidget(
                  leftText: "Your History",
                ),
                Container(
                  height: 260,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    primary: true,
                    itemCount: shoesData.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5,
                    ),
                    itemBuilder: (context, index) {
                      var historyDataStore = shoesData[index];

                      return SingleProductWidget(
                          onPressed: () {
                            PageRouting.goToNextPage(
                              context: context,
                              navigateTo: DetailScreen(
                                data: historyDataStore,
                              ),
                            );
                          },
                          productImage: historyDataStore.productImage,
                          productModel: historyDataStore.productModel,
                          productName: historyDataStore.productName,
                          productOldPrice: historyDataStore.productOldPrice.toDouble(),
                          productPrice: historyDataStore.productPrice.toDouble());
                    },
                  ),
                ),
              ],
            ),
            TabBarBar(
              productData: colothsData,
            ),
            TabBarBar(
              productData: shoesData,
            ),
            TabBarBar(
              productData: accessoriesData,
            ),
          ],
        ),
      ),
    );
  }

 
}