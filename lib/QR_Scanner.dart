import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'package:qr_scanner/Login.dart';
import 'QR_Scanner.dart';

class QR_Scanner extends StatelessWidget {
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
            SizedBox(height: 10.0),
            Image(
              image: AssetImage("assets/Semeion.jpg"),
              width: 100,
              height: 100,
            ),
            //*********************************************************
            Container(
                child: Text(
              "Scanner",
              style: TextStyle(height: 1, fontSize: 50, color: Colors.blue),
            )),
            
            //****************************************************
            Image(
              image: NetworkImage("https://static.thenounproject.com/png/59262-200.png"),
              width: 300,
              height: 300,
            ),

            //**********************************************
            SizedBox(height: 10.0),
            TextFieldWidget(
              hintText: "Scanned Code",
              obscureText: true,
              prefixIconData: Icons.account_balance,
            ),

            //************************* *********************
            //add space between text boxes
            SizedBox(height: 30.0),
            RaisedButton(
              onPressed: () {
                print("you clicked login");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text("Scan"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
