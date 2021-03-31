import 'package:edual/view/widget/BottomNavBar.dart';
import 'package:edual/view/widget/ProgressBar.dart';
import 'package:edual/view/widget/CourseCard.dart';
import 'package:edual/model/Course.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  List<Course> courseList;

  FocusNode _focusSearch;

  final TextEditingController _searchController = TextEditingController();

  HomePage(){
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
  void initState(){
    super.initState();
    _focusSearch = FocusNode();
  }

  @override
  void dispose(){
    _focusSearch.dispose();
    super.dispose();
  }

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
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, top: 15, bottom: 0),
                      child: TextFormField(
                        controller: _searchController,
                        focusNode: _focusSearch,
                        decoration: InputDecoration(
                          suffixIcon:  FlatButton(
                            child: Icon(Icons.search),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          border: OutlineInputBorder(),
                          labelText: 'Search',
                          labelStyle: TextStyle(
                              color: _focusSearch.hasFocus ? Theme.of(context).accentColor : Theme.of(context).primaryColor
                          ),
                          hintText: 'Search',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ),
                        onTap: (){
                          setState(() {
                            FocusScope.of(context).requestFocus(_focusSearch);
                          });},
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top:170.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:'To Watch List:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top:340.0),
              child: Container(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: courseList.length,
                    itemBuilder: (_,index) {
                      return CourseCard(course: courseList[index]);
                    },
                  ),
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