import 'package:edual/view/animation/ElasticInOut.dart';
import 'package:edual/view/screen/CourseDetailPage.dart';
import 'package:edual/view/screen/HomePage.dart';
import 'package:edual/view/screen/StartPage.dart';
import 'package:edual/view/screen/TestPage.dart';
import 'package:flutter/material.dart';
import 'package:edual/view/screen/LoginPage.dart';
import 'package:edual/config.dart' as config;

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> config.startPageViewed ? HomePage() : StartPage(),
        );
      case '/login' :
        return ElasticInOut(widget: LoginPage());
      case '/home' :
        return MaterialPageRoute(
            builder: (_)=> HomePage(),
        );
      case '/course' :
        return MaterialPageRoute(
          builder: (_)=> CourseDetailPage(id: settings.arguments),
        );
      case '/test' :
        return MaterialPageRoute(
          builder: (_)=> TestPage(),
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}
