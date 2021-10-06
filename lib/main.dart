import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter_project/appColors/app_colors.dart';
import 'package:shop_flutter_project/routes/app_routes.dart';
import 'package:shop_flutter_project/screen/loginScreen/login_screen.dart';
import 'package:shop_flutter_project/services/app/app_provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: Core(),
      providers: AppProviders.providers);
  }
}
class Core extends StatelessWidget {
  Core({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.LoginRoute, 
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
            color: AppColors.baseBlackColor,
          )),
         
          primarySwatch: Colors.blue,
        ),
      home: LoginScreen(),
    );
  }
}







