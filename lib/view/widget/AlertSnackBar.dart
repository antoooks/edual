import 'package:flutter/material.dart';

class AlertSnackBar extends StatelessWidget {

  String message;

  AlertSnackBar({this.message});

  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: ((){
        Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              duration: const Duration(seconds: 1),
              action: SnackBarAction(
                label: 'ACTION',
                onPressed: ((){
                  Scaffold.of(context).hideCurrentSnackBar();
                }),
              ),
            ));
      }),
    );
  }
}