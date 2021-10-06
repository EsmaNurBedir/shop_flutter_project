
import 'package:flutter/material.dart';
import 'package:shop_flutter_project/screen/category/category_screen.dart';
import 'package:shop_flutter_project/screen/homePage/home_page.dart';
import 'package:shop_flutter_project/screen/profileScreen/profile_screen.dart';
import 'package:shop_flutter_project/screen/wishlist/wish_list_screen.dart';
import 'package:shop_flutter_project/screen/yourbag/your_bag_screen.dart';

class MyBottomBar extends StatefulWidget {
  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CategoryScreen(),
    YourBagScreen(),
    WishListScreen(),
    ProfileScreen(),
  ];

  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Text("data");
  }

}