import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'Notification.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  File imageFile;

  _openGallary(BuildContext context) async{
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async{

    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDiaglog(BuildContext context){

    return showDialog(context: context, builder:(BuildContext context){
      return AlertDialog(
        title: Text("Make a choice"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallary"),
                onTap: (){
                  _openGallary(context);
                },
              ),
              Padding(padding: EdgeInsets.all(8.0),),
              GestureDetector(
                child: Text("Camera"),
                onTap: (){
                  _openCamera(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  String  employeeID, organization, jobTitle, teamID;
  int mobile;

  Widget _decideImageView(){

    if(imageFile == null)
      return Text("");
    else
      return Image.file(imageFile,width: 150, height: 150);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("archents Profile"),backgroundColor: Colors.blue,
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

        body: SingleChildScrollView(
          child: Column(
            children:<Widget>[
              Container(
                padding: EdgeInsets.only(top: 20,right: 250),
                child: Text("Profile", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Container(
                padding: EdgeInsets.only(top: 20,right: 90, bottom: 30),
                child: Text("Let Us Now Complete Your Profile !", style: TextStyle(fontSize: 15),),
              ),

              Container(
                child: Column(
                  children: <Widget>[
                    _decideImageView(),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    RaisedButton(onPressed: (){
                      _showChoiceDiaglog(context);
                    },
                      child: Text("Choose Picture"),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Employee ID*",
//                    border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(20))
                  ),
                  onChanged: (id){
                    employeeID = id;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Team ID*",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                  ),
                  onChanged: (id){
                    jobTitle = id;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Organization",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                  ),
                  onChanged: (org){
                    organization = org;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Job Title",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                  ),
                  onChanged: (title){
                    jobTitle = title;
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: RaisedButton(
                  child: Text("Update",style: TextStyle(fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
                  padding: EdgeInsets.all(15),
                  onPressed: (){

                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}
