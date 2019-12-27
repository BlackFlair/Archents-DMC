import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Score Board"),backgroundColor: Colors.blue),
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
                  child: Text("Prognosis"),
                  onPressed: (){
                    if(this._currentStep == 0){

                    }
                    else if(this._currentStep == 1){

                    }
                    else if(this._currentStep == 2){

                    }
                  },
                ),
                FlatButton(
                  child: Text("Next"),
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
        title: Text("Personal Score", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 19)),
        content: Text(""),
        isActive: _currentStep >= 0,
      ),
      Step(
        title: Text("Team Score", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 19)),
        content: Text(""),
        isActive: _currentStep >= 1,
      ),
      Step(
        title: Text("Enterprise Score", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 19)),
        content: Text(""),
        isActive: _currentStep >= 2,
      ),
    ];
    return _steps;
  }
}
