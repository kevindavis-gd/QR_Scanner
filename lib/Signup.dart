import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'package:qr_scanner/Login.dart';
import 'package:qr_scanner/Global.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Global().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //************************* first Element *********************
            //add space between text boxes
            SizedBox(height: 10.0),
            Image(
              image: AssetImage(Global().logo),
              width: 100,
              height: 100,
            ),
            //************************** Second Element ************************
            Container(
                child: Text(
              "SignUp",
              style: TextStyle(height: 1, fontSize: 50, color: Global().textColor1),
            )),

            //*********************** Third Element ***********************
            SizedBox(height: 30.0),
            TextFieldWidget(
              hintText: "First Name",
              obscureText: false,
              prefixIconData: Icons.arrow_right,
            ),

            //********************* Fourth Element *************************
            SizedBox(height: 10.0),
            TextFieldWidget(
              hintText: "Last Name",
              obscureText: false,
              prefixIconData: Icons.arrow_right,
            ),

            //********************** Fifth Element ************************
            SizedBox(height: 10.0),
            TextFieldWidget(
              hintText: "Email",
              obscureText: false,
              prefixIconData: Icons.arrow_right,
            ),

            //********************* Sixth Element *************************
            SizedBox(height: 10.0),
            TextFieldWidget(
              hintText: "Phone Number",
              obscureText: false,
              prefixIconData: Icons.arrow_right,
            ),

            //**********************Seventh Element************************
            SizedBox(height: 10.0),
            TextFieldWidget(
              hintText: "Password",
              obscureText: true,
              prefixIconData: Icons.arrow_right,
            ),

            //*************************Eight Element *********************
            //add space between text boxes
            SizedBox(height: 30.0),
            RaisedButton(
              textColor: Global().textColor2,
              onPressed: () {
                print("you clicked login");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text("Signup"),
              color: Global().buttonColor,
            )
          ],
        ),
      ),
    );
  }
}
