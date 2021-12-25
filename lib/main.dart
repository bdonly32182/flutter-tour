import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tour_app/pages/adminpage/admin_service.dart';
import 'package:tour_app/pages/adminpage/member.dart';
import 'package:tour_app/pages/authen.dart';
import 'package:tour_app/pages/buyer/buyer_service.dart';
import 'package:tour_app/pages/create_account.dart';
import 'package:tour_app/pages/guide/guide_service.dart';
import 'package:tour_app/pages/seller/seller_service.dart';
import 'package:tour_app/utils/my_constant.dart';

final Map<String, WidgetBuilder> routesMap = {
  '/authen': (BuildContext context) => Authen(),
  '/createAccount': (BuildContext context) => CreateAccount(),
  '/adminService': (BuildContext context) => AdminService(),
  '/sellerService': (BuildContext context) => SellerService(),
  '/buyerService': (BuildContext context) => BuyerService(),
  '/guideService': (BuildContext context) => GuideService(),
  '/member': (BuildContext context) => Member(),
};
final Map<String, Widget> splashWidget = {
  '/authen': Authen(),
  '/createAccount': CreateAccount(),
  '/adminService': AdminService(),
  '/sellerService': SellerService(),
  '/buyerService': BuyerService(),
  '/guideService': GuideService(),
};

String? initialRoute;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SharedPreferences referrence = await SharedPreferences.getInstance();
  String? role = referrence.getString('role');
  print('###role : $role');
  if (role?.isEmpty ?? true) {
    initialRoute = MyConstant.routeBuyerService;
    runApp(MyApp());
  } else {
    switch (role) {
      case 'admin':
        initialRoute = MyConstant.routeAdminService;
        runApp(MyApp());
        break;
      case 'seller':
        initialRoute = MyConstant.routeSellerService;
        runApp(MyApp());
        break;
      case 'buyer':
        initialRoute = MyConstant.routeBuyerService;
        runApp(MyApp());
        break;
      case 'guide':
        initialRoute = MyConstant.routeGuideService;
        runApp(MyApp());
        break;
      default:
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyConstant.appName,
      routes: routesMap,
      home: AnimatedSplashScreen(
        splash: MyConstant.appLogo,
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 600,
        nextScreen: splashWidget[initialRoute] ?? Authen(),
      ),
    );
  }
}
