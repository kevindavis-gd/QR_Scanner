import "package:flutter/material.dart";
import 'QR_Scanner.dart';
import 'package:qr_scanner/Signup.dart';
import 'package:qr_scanner/Global.dart';
import 'package:qr_scanner/Status2.dart';

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SimpleBarChart.withSampleData()),
                    );
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
                      MaterialPageRoute(builder: (context) => Signup()),
                    );
                  },
                  child: Text("History"),
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

