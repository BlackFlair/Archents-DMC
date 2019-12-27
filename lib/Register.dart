import 'package:archents_dmc/Home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(Register());

class Register extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Digital Compass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegistrationPage(title: 'archents'),
    );
  }
}

class RegistrationPage extends StatefulWidget {

  RegistrationPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _Register createState() => _Register();
}

class _Register extends State<RegistrationPage> {

  String otp, _otp, fName, lName, email, password, conPassword;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            Container(
//              child: Image.asset('assets/archents.png'),
//              width: 80,
//              height: 30,
//            ),
                  Container(
                    padding: EdgeInsets.only(top: 20,right: 175),
                    child: Text("Registration", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                    child:TextField(
                      decoration: InputDecoration(
                          hintText: "First Name*",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                      ),
                      onChanged: (fname){
                        fName = fname;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Last Name*",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                      ),
                      onChanged: (lname){
                        lName = lname;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Mobile*",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                      ),
                      onChanged: (mob){
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Email*",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                      ),
                      onChanged: (mail){
                        email = mail;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Password*",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                      ),
                      obscureText: true,
                      onChanged: (pass){
                        password = pass;
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30,top: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Confirm Password*",
//                          border: OutlineInputBorder(
//                              borderRadius: BorderRadius.circular(20))
                      ),
                      obscureText: true,
                      onChanged: (cpass){
                        conPassword = cpass;
                      },
                    ),
                  ),

            Container(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: RaisedButton(
                  child: Text("Continue", style: TextStyle(fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue)),
                  padding: EdgeInsets.all(15),
                  onPressed: () {

                    if(password != conPassword){
                      showDialog(
                          context: context,
                          builder: (BuildContext newContext) {
                            return AlertDialog(
                              title: Text(
                                  "Password Match Unsuccessful"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text("The entered password does not match. Please enter same password for both Password Field and Confirm Password Field and try again."),
                                  RaisedButton(
                                    color: Colors.green,
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    child: Text("Retry"),
                                  ),
                                ],
                              ),
                            );
                          }
                      );
                    }
                    else{
                      showDialog(
                          context: context,
                          builder: (BuildContext newContext) {
                            return AlertDialog(
                              title: Text("Email Verification"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                      "Please enter the verification code from the registered Email to continue."),
                                  TextField(
                                    onChanged: (OTP) {
                                      otp = OTP;
                                      _otp = "123";

                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.green,
                                    onPressed: () {
                                      if (_otp == otp) {
                                        Navigator.pop(context);
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Home()));
                                      }
                                      else {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext newContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Verification Unsuccessful"),
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    Text("Entered verification code is incorrect."),
                                                  ],
                                                ),
                                              );
                                            }
                                        );
                                      }
                                    },
                                    child: Text("Verify", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 19)),
                                  ),
                                ],
                              ),
                            );
                          }
                      );
                    }
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}