import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:shop_flutter_project/appColors/app_colors.dart';
import 'package:shop_flutter_project/routes/app_routes.dart';
import 'package:shop_flutter_project/screen/homePage/home_page.dart';
import 'package:shop_flutter_project/services/notifier/authentication_notifier.dart';
import 'package:shop_flutter_project/widgets/my_button_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailConroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    emailConroller = TextEditingController();
    passwordcontroller = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthenticationNotifier authenticationNotifier =
        Provider.of<AuthenticationNotifier>(context, listen: false);
    return Scaffold(
        body: ListView(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(top: 30),
              child: Column(children: [
                Image.asset(
                  "assets/images/Logo.png",
                  height: 300,
                ),
                SizedBox(
                 height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: emailConroller,
                      decoration: InputDecoration(
                        hintText: "Enter email",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0)),
                        hintStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: passwordcontroller,
                      decoration: InputDecoration(
                        hintText: "Enter password",
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10.0)),
                        hintStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: MyButtonWidget(
                            text: "Login",
                            color: AppColors.baseDarkPinkColor,
                            onPress: () async {
                              String email = emailConroller.text;
                              String password = passwordcontroller.text;

                              if (email.isNotEmpty && password.isNotEmpty) {
                                await authenticationNotifier.login(
                                    email: email, password: password);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Fill the credentials")));
                              }

                              if (email.isEmpty || password.isEmpty) {
                                Navigator.of(context)
                                    .pushNamed(AppRoutes.SingupRoute);
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                          ))
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ));
  }
  
}
