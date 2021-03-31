import 'package:edual/view/animation/ElasticInOut.dart';
import 'package:flutter/material.dart';
import 'package:edual/config.dart' as config;

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/PNG/start_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: null,
          ),
          Padding(
            padding: const EdgeInsets.only(top:650.0),
            child: Center(
              child: ElevatedButton(
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(230.0,40.0),
                  primary: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: (() {
                  config.startPageViewed = true;
                  Navigator.pushNamed(context, '/home');
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}