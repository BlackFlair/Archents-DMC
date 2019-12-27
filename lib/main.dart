import 'package:archents_dmc/Register.dart';
import 'package:flutter/material.dart';
import 'package:archents_dmc/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Digital Compass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String username, password, user = "master", pass = "123", email;
  bool hideText = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body:SingleChildScrollView(
        child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Container(
                height: 80,
              ),
              Container(
                  child: Image.asset('assets/archents_logo.png'),
                  width: 100,
                  height: 100,
                ),
              Container(
                child: Image.asset('assets/archents.png'),
                width: 400,
                height: 100,
              ),
              Container(
                child: Text("Digital Compass", style: TextStyle(fontSize: 14, color: Colors.black),),
                height: 40,
              ),
              Container(
                padding: EdgeInsets.only(left: 60,right: 60,top: 30),
                child:TextField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    prefixIcon: IconButton(icon: Icon(Icons.email)),
                  ),
                  onChanged: (user){
                    username = user;
                  },
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 60,right: 60, top: 20),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    prefixIcon: IconButton(icon: Icon(Icons.lock),),
                    suffixIcon: IconButton(onPressed: (){setState(() {
                      hideText = false;
                    });}, icon: Icon(Icons.visibility), tooltip: "Show Password",)
                  ),
                  obscureText: hideText,
                  onChanged: (pass){
                    password = pass;
                  },
                ),
              ),


             Container(
               padding: EdgeInsets.only(top: 10),
               child: FlatButton(
                 child: Text("Sign In",style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Colors.blue)),
                 padding: EdgeInsets.all(20),
                 onPressed: () {

                   if(username == user && password == pass) {
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context) => Home()));
                   }
                   else {
                     showDialog(
                         context: context,
                         builder: (BuildContext newContext){
                           return AlertDialog(
                             title: Text("Invalid Email Or Password"),
                             content: Column(
                               mainAxisSize: MainAxisSize.min,
                               children: <Widget>[
                                 Text("Entered Email or Password is Invalid. Please try again."),
                                 RaisedButton(
                                   color: Colors.green,
                                   onPressed: () {
                                     Navigator.pop(context);
                                   },
                                   child: Text("Retry", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 19)),
                                 ),
                               ],
                             ),
                           );
                         }
                     );
                   }
                 },
               ),
             ),

              Container(
                padding: EdgeInsets.only(bottom: 80),
                child: FlatButton(
                  child: Text("Forgot Password ?", style: TextStyle(fontSize: 15, color: Colors.grey[400]),),
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (BuildContext newContext){
                          return AlertDialog(
                            title: Text("Forgot Password ?"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[

                                Text("Enter your registered Email to proceed with change of password."),

                                TextField(
                                  onChanged: (mail){
                                    email = mail;
                                  },
                                ),
                                Container(
                                  height: 20,
                                ),
                                RaisedButton(
                                  color: Colors.green,
                                  onPressed: () {
                                    Navigator.pop(context);

                                    showDialog(
                                      context: context,
                                      builder: (BuildContext newContext){
                                        return AlertDialog(
                                          title: Text("Check Your Mail"),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Text("A mail has been sent to your email with the instructions to change your password.")
                                            ],
                                          ),
                                        );
                                      },
                                    );

                                  },
                                  child: Text("Next", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 19)),
                                ),
                              ],
                            ),
                          );
                        }
                    );
                  },
                ),
              ),
//              Container(
//                height: 60,
//              ),
              Container(
                padding: EdgeInsets.only(top: 5,bottom: 5),
                color: Colors.lightBlue,
                child: FlatButton(
                  child: Text("Register",style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal, color: Colors.white),),
                  padding: EdgeInsets.only(right: 150, left: 150),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
              )
            ]
        ),
      ),
    );
  }
}