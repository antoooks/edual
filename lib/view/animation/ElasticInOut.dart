import 'package:flutter/cupertino.dart';

class ElasticInOut extends PageRouteBuilder{
  final Widget widget;
  ElasticInOut({this.widget}) : super(
      pageBuilder: (context, animation, animationTime){
        return widget;
      },
      transitionDuration: Duration(seconds: 1),
      transitionsBuilder: (context, animation, animationTime, child){
      animation = CurvedAnimation(parent: animation, curve: Curves.elasticInOut);
            return ScaleTransition(
            scale: animation,
            child: child,
          );
        }
      );
}