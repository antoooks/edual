import 'package:edual/view/widget/BottomNavBar.dart';
import 'package:edual/view/widget/ProgressBar.dart';
import 'package:flutter/material.dart';

class CourseDetailPage extends StatelessWidget {

  int id;

  CourseDetailPage({@required this.id});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBody: true,
      body: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/PNG/course_detail_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child:  null,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top:60.0, left: 300.0),
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text:'120',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.stars_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top:100.0,left:20.0),
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text:'Hello, Agapie!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top:170.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: ProgressBar(),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top:340.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}