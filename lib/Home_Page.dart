import "package:flutter/material.dart";
import 'QR_Scanner.dart';
import 'package:qr_scanner/Signup.dart';
import 'package:qr_scanner/Global.dart';
import 'package:qr_scanner/Status2.dart';
import 'package:qr_scanner/User_History.dart';
import 'package:qr_scanner/Workout_Tutorials.dart';
import 'package:qr_scanner/Workout_Tutorials2.dart';
import'status_Date.dart';
import "package:http/http.dart" as http;

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //do not resize the elements when the keyboard is open
      resizeToAvoidBottomPadding: false,
      backgroundColor: Global().backgroundColor,
      body: Padding(
        //padding on all sides
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //an array that stores multiple widgets
            children: <Widget>[
              //*************************first Element *********************
              //add space between text boxes
              SizedBox(height: 40.0),
              //inserts an image widget
              Image(
                image: AssetImage(Global().logo),
                width: 200,
                height: 200,
              ),
              //*************************Second Element *********************
              //add space between text boxes
              SizedBox(height: 60.0),
              //this sized box is used to contain a button
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  textColor: Global().textColor2,
                  //when the button is pressed do something
                  onPressed: () {
                    print("you clicked QR code");
                    Navigator.push(
                      context,
                      //go to a new page/view
                      MaterialPageRoute(builder: (context) => QR_Scanner()),
                    );
                  },
                  //the text of the button
                  child: Text("QR Code"),
                  //color of button
                  color: Global().buttonColor,
                ),
              ),
              //*************************Third Element *********************
              SizedBox(height: 30.0),
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  textColor: Global().textColor2,
                  onPressed: () {
                    print("you clicked Status");
                    Send_DateStatusRequest(context);
                  },
                  child: Text("Status"),
                  color: Global().buttonColor,
                ),
              ),
              //*************************Fourth Element *********************
              SizedBox(height: 30.0),
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  textColor: Global().textColor2,
                  onPressed: () {
                    print("you clicked History");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => User_History()),
                    );
                  },
                  child: Text("History"),
                  color: Global().buttonColor,
                ),
              ),
              //*************************Fifth Element *********************
              SizedBox(height: 30.0),
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  textColor: Global().textColor2,
                  onPressed: () {
                    print("you clicked Workout Tutorials");
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Workout_Tutorials2()),
                    );
                  },
                  child: Text("Workouts"),
                  color: Global().buttonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// function to perform post Date Status request
// ****************************************************************************
void Send_DateStatusRequest(BuildContext context) async {
  //url of local database
  String gettoken =await Global().username.read(key: "jwt");
  String token = gettoken.substring(10,50);
  final String apiUrl = "http://10.0.2.2:8000/api/checkin/getDateStatus";
  final response = await http.get(
    apiUrl,
    headers: {
      "Authorization": "Token " + token
    },
  );
  String fullResponse = response.statusCode.toString() + response.body;

  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            Status_Date(fullResponse)),
  );
}