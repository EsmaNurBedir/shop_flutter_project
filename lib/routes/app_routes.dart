

import 'package:shop_flutter_project/screen/loginScreen/login_screen.dart';
import 'package:shop_flutter_project/screen/signup/signup_screen.dart';

class AppRoutes{
    static const String LoginRoute = "/login";
    static const String SingupRoute = "/Singup";

    static final routes = {
     LoginRoute : (context)=> LoginScreen(),
     SingupRoute : (context)=> SignupScreen()
    };

    
}
