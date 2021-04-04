import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'package:qr_scanner/Signup.dart';
import 'package:qr_scanner/Home_Page.dart';
import "package:qr_scanner/Global.dart";
import "package:http/http.dart" as http;
import "dart:async";
import "dart:convert";
import 'dart:convert' show json, base64, ascii;
import "package:rflutter_alert/rflutter_alert.dart";

class Login extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();

  //entire text field widget saved into variable
  var mNumberField = TextFieldWidget(hintText: "M-Number", obscureText: false, prefixIconData: Icons.arrow_right,);
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
            //*************************Logo *********************
            //add space between text boxes
            SizedBox(height: 40.0),
            Image(
              image: AssetImage(Global().logo),
              width: 200,
              height: 200,
            ),
            //*************************mNumber Field *********************
            //add space between text boxes
            SizedBox(height: 40.0),
            mNumberField,
            //add space between text boxes
            //*************************Password Field *********************
            SizedBox(height: 10.0),
            PasswordField,
            //************************* Login Button *********************
            //add space between text boxes
            SizedBox(height: 60.0),
            RaisedButton(
              textColor: Global().textColor2,
              onPressed: () async {
                //get the text from the email field
                String mNumber = mNumberField.getText().text;
                //get the text from the Password Field
                String password = PasswordField.getText().text;
                //call the method to make the post request and store response
                var fullResponse = await Send_login(mNumber, password);
                var statusCode = fullResponse.substring(0,3);
                //if login successful go to home page
                if (statusCode == "200")
                {
                  //save the token
                  var jwt = fullResponse.substring(3,);
                  if(jwt != null) {
                    Global().username.write(key: "username", value: mNumberField.getText().text);
                    Global().StrUsername = mNumberField.getText().text;
                    Global().storage.write(key: "jwt", value: jwt);
                    Global().StrToken = jwt.toString();
                  }
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Page()));
                }
                //if login not successful display message
                else
                  {
                    displayDialogAlert(context, AlertType.error, "Error", fullResponse.substring(3,));
                  }
              },
              child: Text("Login"),
              color: Global().buttonColor,
            ),
            //*************************Signup Button *********************
            //add space between text boxes
            SizedBox(height: 1.0),
            RaisedButton(
              textColor: Global().textColor2,
              onPressed: () async
              {
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

 ///////////////////////////////////////////////////////////////////
// function to send the login request
///////////////////////////////////////////////////////////////////
  Future<String> Send_login(String mNumber, String password) async {
    //url of local database
    final String apiUrl = "http://10.0.2.2:8000/users/login/";
    //request body
    Map data = {
      "username": mNumber,
      "password": password,
    };
    //encode the data into json format
    String body = json.encode(data);
    final response = await http.post(
      apiUrl, headers: {"Content-Type": "application/json"}, body: body,);
    print(response.body);
    print(response.statusCode.toString());
    //first 3 char is the response status code
    String fullResponse = response.statusCode.toString() + response.body;
    return fullResponse;
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
  }}