import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'QR_Scanner.dart';
import 'package:qr_scanner/Signup.dart';

class Login extends StatelessWidget {
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
            //*************************second Element *********************
            //add space between text boxes
            SizedBox(height: 40.0),
            TextFieldWidget(
              hintText: "Email",
              obscureText: false,
              prefixIconData: Icons.mail_outline,
            ),
            //add space between text boxes
            SizedBox(height: 10.0),
            //*************************Third Element *********************
            TextFieldWidget(
              hintText: "Password",
              obscureText: true,
              prefixIconData: Icons.lock_outline,
            ),
            //*************************fourthElement *********************
            //add space between text boxes
            SizedBox(height: 60.0),
            RaisedButton(
              onPressed: () {
                print("you clicked login");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QR_Scanner()),
                );
              },
              child: Text("Login"),
              color: Colors.blue,
            ),
            //*************************fifth Element *********************
            //add space between text boxes
            SizedBox(height: 1.0),
            RaisedButton(
              onPressed: () {
                print("you clicked login");

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Text("Signup"),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
