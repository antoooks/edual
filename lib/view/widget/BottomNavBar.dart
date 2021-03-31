import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return BottomNavigationBar(
      elevation: 10.0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Course',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_rounded),
          label: 'Account',
        ),
      ],
    );
  }
}