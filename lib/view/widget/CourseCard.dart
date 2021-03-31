import 'package:edual/model/Course.dart';
import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final Course course;

  CourseCard({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: InkWell(
          splashColor: Colors.grey.withAlpha(30),
          onTap: () {
            Navigator.pushNamed(context,'/course',arguments: '${course.courseId}');
          },
          child: Container(
            width: 300,
            height: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Image.asset('${course.imageUrl}'),
                  title: Text('${course.title}'),
                  subtitle:
                    Text('${course.description}'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
