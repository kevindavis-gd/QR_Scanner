import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'package:qr_scanner/Signup.dart';
import 'package:qr_scanner/Home_Page.dart';
import "package:qr_scanner/Global.dart";
import "package:http/http.dart" as http;
import "dart:async";
import "dart:convert";

class Login extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  var EmailField = TextFieldWidget(hintText: "Email", obscureText: false, prefixIconData: Icons.mail_outline,);
  var PasswordField = TextFieldWidget(hintText: "Password", obscureText: true, prefixIconData: Icons.lock_outline,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //do not resize the elements when the keyboard is open
      resizeToAvoidBottomPadding: false,
      backgroundColor: Global().backgroundColor,
      //resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          //an array that stores multiple widgets
          children: <Widget>[
            //*************************first Element *********************
            //add space between text boxes
            SizedBox(height: 40.0),
            Image(
              image: AssetImage(Global().profilePicture),
              width: 200,
              height: 200,
            ),
            //*************************second Element *********************
            //add space between text boxes
            SizedBox(height: 40.0),
            EmailField,
            //add space between text boxes
            //*************************Third Element *********************
            SizedBox(height: 10.0),
            PasswordField,
            //*************************fourthElement *********************
            //add space between text boxes
            SizedBox(height: 60.0),
            RaisedButton(
              textColor: Global().textColor2,
              onPressed: () {
                print("you clicked login");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home_Page()),
                );
              },
              child: Text("Login"),
              color: Global().buttonColor,
            ),
            //*************************fifth Element *********************
            //add space between text boxes
            SizedBox(height: 1.0),
            RaisedButton(
              textColor: Global().textColor2,
              onPressed: () async
              {
                String email = EmailField.getText().text;
                String name = PasswordField.getText().text;
                final String user = await Send_Signup (email,name);
                print(user);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
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

  // function to perform post request
  Future<String> Send_Signup (String name, String jobTitle) async {
    //url of local database
    final String apiUrl = "http://10.0.2.2:8000/api/Checkin/";
    //request body
    Map data = {
      "mustangsID": "M20285574",
      "buildingID": "Bolin567",
      "checkIn": "false",
      "scanTime": "IDK"
    };
    String body = json.encode(data);
    final response = await http.post(apiUrl, headers: {"Content-Type": "application/json"},
      body: body,);
    if(response.statusCode == 200)
    {
      return response.body ;
    }
    else
    {
      print (response.statusCode);
      return response.body;
    }
  }
}
