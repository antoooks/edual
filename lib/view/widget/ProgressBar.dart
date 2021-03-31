import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressBar extends StatefulWidget {
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar>{
  @override
  Widget build(BuildContext context){
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:40.0),
              child: RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                        text:'Continue Course',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ]
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top:20.0, left: 45.0),
            child: LinearPercentIndicator(
              width: 290.0,
              lineHeight: 14.0,
              percent: 0.7,
              backgroundColor: Colors.white,
              progressColor: Theme.of(context).primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:'Finish the course to earn 20 points!',
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

          ],
        ),
      ),
    );
  }
}