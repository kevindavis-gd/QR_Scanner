import 'dart:ffi';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  String qrCodeResult = "Unknown";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      //resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //*************************first Element *********************
            //add space between text boxes
            SizedBox(height: 40.0),
            Image(
              image: AssetImage("assets/Semeion.jpg"),
              width: 200,
              height: 200,
            ),

            //*************************fifth Element *********************
            //add space between text boxes
            SizedBox(height: 1.0),
            RaisedButton(
              onPressed: () {
                print("you clicked login");
              },
              child: Text("Signup"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  } //Widget build
} //HomePage
