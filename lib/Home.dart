import 'package:flutter/material.dart';
import 'package:archents_dmc/Profile.dart';
import 'Learning.dart';
import 'Assessment.dart';
import 'Settings.dart';
import 'Notification.dart';
import 'Score.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String name = "Name", email = "Email@archents.com";

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("archents Home"),backgroundColor: Colors.blue,
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
            UserAccountsDrawerHeader(
              accountName: Text(name),
              accountEmail: Text(email),
              currentAccountPicture: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Profile()));
                },
                child: CircleAvatar(
                  backgroundImage:NetworkImage(""),
                ),
              ),
//              decoration: BoxDecoration(
//                image: DecorationImage(
//                  fit: BoxFit.fill,
//                  image: NetworkImage(""),
//                ),
//              ),
            ),
            ListTile(
              title: Text("Learning"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Learning()));
              },
            ),
            ListTile(
              title: Text("Take Assessment"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Assessment()));
              },
            ),
            ListTile(
              title: Text("Score Board"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Score()));
              },
            ),
            Divider(),
            ListTile(
              title: Text("Settings"),
              trailing: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => Settings()));
              },
            ),
          ],
        ),
      ),
      body: Stepper(
        steps: _mySteps(),
        currentStep: this._currentStep,
        onStepTapped: (step){
          setState((){
            this._currentStep = step;
          });
        },
        onStepContinue: (){
          setState(() {
            if(this._currentStep < this._mySteps().length - 1){
              this._currentStep = this._currentStep + 1;
            }
            else{

            }
          });
        },
        onStepCancel: (){
          setState(() {
            if(this._currentStep > 0){
              this._currentStep = this._currentStep - 1;
            }
            else{
              this._currentStep = 0;
            }
          });
        },
        controlsBuilder: (BuildContext context,{VoidCallback onStepContinue, VoidCallback onStepCancel}){
          return Row(
            children: <Widget>[
              FlatButton(
                child: Text("Complete Step"),
                onPressed: (){
                  if(this._currentStep == 0){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Profile()));
                  }
                  else if(this._currentStep == 1){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Assessment()));
                  }
                  else if(this._currentStep == 2){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => Score()));
                  }
                },
              ),
              FlatButton(
                child: Text("Next Step"),
                onPressed: onStepContinue,
              )
            ],
          );
        },
      ),
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
        title: Text("Complete Profile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 19)),
        content: Text("Complete this step to update your profile.", style: TextStyle(color: Colors.black, fontSize: 14)),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text("Take Assessment", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 19)),
        content: Text("Lets take the assessment!", style: TextStyle(color: Colors.black, fontSize: 14)),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text("View Score", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 19)),
        content: Text("You have completed your assessment. Lets view your score.", style: TextStyle(color: Colors.black, fontSize: 14)),
        isActive: _currentStep >= 2,
      ),
    ];
    return _steps;
  }
}