import 'package:flutter/material.dart';
import 'package:hydroponic/loginRegister/login.dart';
import 'package:hydroponic/loginRegister/register.dart';
import 'package:hydroponic/mainMenu/mainMenu.dart';
import 'package:hydroponic/menuHealty/healtyPage.dart';
import 'package:hydroponic/menuMarket/market.dart';
import 'package:hydroponic/menuMyPlant/myPlantPageDetail.dart';
import 'package:hydroponic/provider/provider.dart';
import 'package:hydroponic/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(builder: (_) => UserProvider.initialize(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.green
      ),
      home: ScreenController(),
    ),));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unaunthenticated:
      case Status.Aunthenticating:
        return LoginPage();
      case Status.Authenticated:
        return MainMenu();
      default : return LoginPage();
    }
  }
}

// void main(List<String> args) {
//   runApp(new MaterialApp(
//     routes: {
//       '/' : (BuildContext _) => LoginPage(),
//       '/menuLearning' : (BuildContext _) => MenuLearning(),
//       '/menuHealty' : (BuildContext _) => HealtyPage(),
//     },
//     initialRoute: '/',
//     ));
// }