import 'package:flutter/material.dart';
import 'package:archents_dmc/Score.dart';
import 'package:archents_dmc/Notification.dart';
import 'package:archents_dmc/Assessment.dart';
import 'resilience.dart';
import 'culture.dart';
import 'skills.dart';
import 'seo.dart';


class leadership extends StatefulWidget {
  @override
  _leadershipState createState() => _leadershipState();
}

class _leadershipState extends State<leadership> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Assessment/Leadership"),backgroundColor: Colors.blue,
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              child: Text("Assessment", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 48)),
              height: 150,
            ),
            ListTile(
              title: Text("Assessments"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Assessment()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Strategic Enterprise Operations"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => seo()));
              },
            ),
//            ListTile(
//              title: Text("Leadership"),
//              trailing: Icon(Icons.arrow_right),
//              onTap: () {
//                Navigator.pop(context);
//                Navigator.push(context, MaterialPageRoute(
//                    builder: (context) => leadership()));
//              },
//            ),
            ListTile(
              title: Text("Culture"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => culture()));
              },
            ),
            ListTile(
              title: Text("Resilience"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => resilience()));
              },
            ),
            ListTile(
              title: Text("Skills"),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => skills()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Score Board"),
              trailing: Icon(Icons.score),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Score()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
