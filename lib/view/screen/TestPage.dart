import 'package:edual/model/Course.dart';
import 'package:edual/view/widget/CourseCard.dart';
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget{

  List<Course> courseList;

  TestPage(){
    Course course1 = Course(
      "Understanding Money",
      1,
      5,
      description: "5 hours",
      imageUrl: "assets/images/PNG/img-8.png",
    );
    Course course2 = Course(
      "Mindset and Creativity Exercises",
      2,
      5,
      description: "6 hours",
      imageUrl: "assets/images/PNG/img-7.png",
    );
    courseList = [course1,course2];
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
                shrinkWrap: true,
                itemCount: courseList.length,
                itemBuilder: (_,index) {
                  return CourseCard(course: courseList[index]);
                },
        ),
      ),
    );
  }
}
