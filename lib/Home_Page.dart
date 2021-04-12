import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'QR_Scanner.dart';
import 'package:qr_scanner/Global.dart';
import 'package:qr_scanner/User_History.dart';
import 'package:qr_scanner/Workout_Tutorials2.dart';
import'status_Date.dart';
import 'package:qr_scanner/Login.dart';
import "package:http/http.dart" as http;
import 'package:qr_scanner/Questionnaire.dart';


/////////////////////////////////////////////////
//Main home page with multiple options
/////////////////////////////////////////////////
class Home_Page extends StatelessWidget {

  double fontsize = 15;
  double buttonwidth = 150;
  double buttonheight = 40;

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
              //*************************QR Scanner Button *********************
              //add space between text boxes
              SizedBox(height: 20.0),
              //this sized box is used to contain a button
              SizedBox(
                width: buttonwidth ,
                height: buttonheight,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
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
                  child: Text("QR Code", style: TextStyle(fontSize: fontsize)),
                  //color of button
                  color: Global().buttonColor,

                ),
              ),
              //*************************Status Button *********************
              SizedBox(height: 20.0),
              SizedBox(
                width: buttonwidth ,
                height: buttonheight,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
                  textColor: Global().textColor2,
                  onPressed: () {
                    print("you clicked Gym Usage");
                    //call the function to get the data from backend
                    Send_DateStatusRequest(context);
                  },
                  child: Text("Gym Usage", style: TextStyle(fontSize: fontsize)),
                  color: Global().buttonColor,
                ),
              ),
              //*************************User History Button *********************
              SizedBox(height: 20.0),
              SizedBox(
                width: buttonwidth ,
                height: buttonheight,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
                  textColor: Global().textColor2,
                  onPressed: () {
                    print("you clicked History");
                    Navigator.push(
                      context,
                      //go to a new page/view
                      MaterialPageRoute(builder: (context) => User_History()),
                    );
                  },
                  child: Text("History", style: TextStyle(fontSize: fontsize)),
                  color: Global().buttonColor,
                ),
              ),
              //*************************Work Tutorial Button *********************
              SizedBox(height: 20.0),
              SizedBox(
                width: buttonwidth ,
                height: buttonheight,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
                  textColor: Global().textColor2,
                  onPressed: () {
                    print("you clicked Workout Tutorials");
                    Navigator.push(
                      context,
                      //go to a new page/view
                      MaterialPageRoute(builder: (context) => Workout_Tutorials2()),
                    );
                  },
                  child: Text("Workouts", style: TextStyle(fontSize: fontsize)),
                  color: Global().buttonColor,
                ),
              ),
              //*************************Questionnaire *********************
              SizedBox(height: 20.0),
              //this sized box is used to contain a button
              SizedBox(
                width: buttonwidth ,
                height: buttonheight,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
                  textColor: Global().textColor2,
                  //when the button is pressed do something
                  onPressed: () {
                    Global().storage.deleteAll();
                    print("you clicked Questionnaire");
                    Navigator.push(
                      context,
                      //go to a new page/view
                      MaterialPageRoute(builder: (context) => Questionnaire()),
                    );
                  },
                  //the text of the button
                  child: Text("Questionnaire", style: TextStyle(fontSize: fontsize)),
                  //color of button
                  color: Global().buttonColor,
                ),
              ),
              //*************************Logout Button *********************
              SizedBox(height: 20.0),
              //this sized box is used to contain a button
              SizedBox(
                width: buttonwidth ,
                height: buttonheight,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),),
                  textColor: Global().textColor2,
                  //when the button is pressed do something
                  onPressed: () {
                    Global().storage.deleteAll();
                    print("you clicked Logout");
                    Navigator.push(
                      context,
                      //go to a new page/view
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  //the text of the button
                  child: Text("Logout", style: TextStyle(fontSize: fontsize)),
                  //color of button
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


/////////////////////////////////////////////////
// function to perform Date Status request
/////////////////////////////////////////////////
void Send_DateStatusRequest(BuildContext context) async {
  //get the token information from the secure storage
  String gettoken =await Global().storage.read(key: "jwt");
  String token = gettoken.substring(10,50);
  //url of local database
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
    //go to new page and pass the full response to it
    MaterialPageRoute(builder: (context) => Status_Date(fullResponse)),
  );
}