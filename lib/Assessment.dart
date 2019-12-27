import 'package:archents_dmc/Score.dart';
import 'package:archents_dmc/SubAssessments/culture.dart';
import 'package:archents_dmc/SubAssessments/leadership.dart';
import 'package:archents_dmc/SubAssessments/resilience.dart';
import 'package:archents_dmc/SubAssessments/seo.dart';
import 'package:archents_dmc/SubAssessments/skills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Notification.dart';

class Assessment extends StatefulWidget {
  @override
  _AssessmentState createState() => _AssessmentState();
}

class _AssessmentState extends State<Assessment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("archents Assessment"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => Notifications()));
          },
        ),
      ],
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("SEO"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => seo()));
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Culture"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => culture()));
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Leadership"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => leadership()));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      child: Text("Resilience"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => resilience()));
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Skills"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => skills()));
                      },
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      child: Text("Score"),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Score()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}