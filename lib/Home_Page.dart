import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'QR_Scanner.dart';
import 'package:qr_scanner/Signup.dart';
import 'package:qr_scanner/Global.dart';

class Home_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      //resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //*************************first Element *********************
              //add space between text boxes
              SizedBox(height: 40.0),
              Image(
                image: AssetImage(Global().logo),
                width: 200,
                height: 200,
              ),
              //*************************Second Element *********************
              //add space between text boxes
              SizedBox(height: 60.0),
              SizedBox(
                width: 100.0,
                height: 50.0,
                child: RaisedButton(
                  textColor: Global().textColor2,
                  onPressed: () {
                    print("you clicked QR code");

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QR_Scanner()),
                    );
                  },
                  child: Text("QR Code"),
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
                      MaterialPageRoute(builder: (context) => Signup()),
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
