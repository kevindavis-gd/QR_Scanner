import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'QR_Scanner.dart';
import 'package:qr_scanner/Global.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:qr_scanner/Home_Page.dart';
import 'package:qr_scanner/User_History.dart';
import 'package:qr_scanner/Workout_Tutorials2.dart';
import'status_Date.dart';
import 'package:qr_scanner/Login.dart';
import "package:http/http.dart" as http;


/////////////////////////////////////////////////
//Main home page with multiple options
/////////////////////////////////////////////////
class Questionnaire extends StatefulWidget {
  @override
  _QuestionnaireState createState() => _QuestionnaireState();
}
class _QuestionnaireState extends State<Questionnaire> {

  bool fever_checkbox = false;
  bool symptoms_checkbox = false;
  bool breath_checkbox = false;
  bool nose_checkbox = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //do not resize the elements when the keyboard is open
      resizeToAvoidBottomPadding: false,
      //get the background color from the global class
      backgroundColor: Global().backgroundColor,
      body: Padding(
        //padding on all sides
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //an array that stores multiple widgets
            children: <Widget>[

              //*************************logo Image ***************************
              //add space between text boxes
              SizedBox(height: 40.0),
              //inserts an image widget
              Image(
                image: AssetImage(Global().logo),
                width: 200 ,
                height: 200,
              ),
              //*******************************************************
              Row(
                children: [
                  Checkbox(
                    value: fever_checkbox,
                    onChanged: (value) {
                      setState(() {
                        fever_checkbox = !fever_checkbox;
                      });
                    },
                  ),
                  Text('I do not have a fever',
                      style: TextStyle(
                          color: Global().textColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                ],
              ),
              //*******************************************************
              Row(
                children: [
                  Checkbox(
                    value: symptoms_checkbox,
                    onChanged: (value) {
                      setState(() {
                        symptoms_checkbox = !symptoms_checkbox;
                      });
                    },
                  ),
                  Text('I do not have any Covid-19 symptoms',
                      style: TextStyle(
                      color: Global().textColor1,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0)),
                ],
              ),
              //*******************************************************
              Row(
                children: [
                  Checkbox(
                    value: breath_checkbox,
                    onChanged: (value) {
                      setState(() {
                        breath_checkbox = !breath_checkbox;
                      });
                    },
                  ),
                  Text('I do not have any shortness of breath',
                      style: TextStyle(
                          color: Global().textColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                ],
              ),
              //*******************************************************
              Row(
                children: [
                  Checkbox(
                    value: nose_checkbox,
                    onChanged: (value) {
                      setState(() {
                        nose_checkbox = !nose_checkbox;
                      });
                    },
                  ),
                  Text('I do not have a runny nose',
                      style: TextStyle(
                          color: Global().textColor1,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0)),
                ],
              ),
              //************************Submit button*********************
              //add space between text boxes
              SizedBox(height: 40),
              SizedBox(
                height: 40,
                width: 200,
                child: RaisedButton(

                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
                  textColor: Global().textColor2,
                  onPressed: () async
                  {
                    if (fever_checkbox && symptoms_checkbox && nose_checkbox && breath_checkbox)
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Page()),);
                      }
                    else {
                      displayDialogAlert(context, AlertType.error, "STOP", 'Please exit the gym and visit the nearest doctor for a Covid-19 test');
                    };
                  },
                  child: Text("Submit"),
                  color: Global().buttonColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////
// alert dialog box function
///////////////////////////////////////////////////////////////////
void displayDialogAlert(BuildContext context, AlertType type, title, String text)
{
  Alert(
    context: context,
    type: type,
    title: title,
    desc: text,
    buttons: [
      DialogButton(
        child: Text(
          "ok",
          style: TextStyle(color: Global().textColor2, fontSize: 20),
        ),
        onPressed:()async => await Navigator.pop(context),
        color: Global().buttonColor,
      )
    ],
  ).show();
}