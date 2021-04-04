
import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'package:qr_scanner/Global.dart';
import "package:http/http.dart" as http;
import "dart:async";
import "dart:convert";
import "package:rflutter_alert/rflutter_alert.dart";
import "Global.dart";


//////////////////////////////////////////////////////////
// Stateless widget for registration form
/////////////////////////////////////////////////////////
class Signup extends StatelessWidget {
  //entire text field widget saved into variable
  var firstNameField = TextFieldWidget(hintText: "First Name", obscureText: false, prefixIconData: Icons.arrow_right,);
  var lastNameField = TextFieldWidget(hintText: "Last Name", obscureText: false, prefixIconData: Icons.arrow_right,);
  var mNumberField = TextFieldWidget(hintText: "Mustang Number", obscureText: false, prefixIconData: Icons.arrow_right,);
  var emailField = TextFieldWidget(hintText: "Email", obscureText: false, prefixIconData: Icons.mail_outline,);
  var passwordField1 = TextFieldWidget(hintText: "Password", obscureText: true, prefixIconData: Icons.lock_outline,);
  var passwordField2 = TextFieldWidget(hintText: "Retype Password", obscureText: true, prefixIconData: Icons.lock_outline,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //do not resize the elements when keyboard is open
      resizeToAvoidBottomPadding: false,
      backgroundColor: Global().backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          //beginning of column
          mainAxisAlignment: MainAxisAlignment.start,
          //an array that stores multiple widgets
          children: <Widget>[
            //************************** Sign Text/Heading ************************
            SizedBox(height: 30.0),
            Container(
              child: Text(
                "SignUp",
                style: TextStyle(height: 1, fontSize: 50, color: Global().textColor1),
              ),
            ),
            //***********************First Name Field***********************
            SizedBox(height: 30.0),
            firstNameField,
            //*********************Last Name Field*************************
            SizedBox(height: 10.0),
            lastNameField,
            //**********************mNumber Field************************
            SizedBox(height: 10.0),
            mNumberField,
            //*********************Email Field*************************
            SizedBox(height: 10.0),
            emailField,
            //**********************Password1 Field************************
            SizedBox(height: 10.0),
            passwordField1,
            //*************************Password2 Field*********************
            SizedBox(height: 10.0),
            passwordField2,
            //************************* SignUp Button*********************
            //add space between text boxes
            SizedBox(height: 30.0),
            RaisedButton(
              textColor: Global().textColor2,
              //mark function as async
              onPressed: () async{
                //get the text from the field
                String firstName = firstNameField.getText().text;
                //get the text from the field
                String lastName = lastNameField.getText().text;
                //get the text from the field
                String mNumber = mNumberField.getText().text;
                //get the text from the field
                String email = emailField.getText().text;
                //get the text from the field
                String password1 = passwordField1.getText().text;
                //get the text from the Field
                String password2 = passwordField2.getText().text;

                //call the method to make the post request
                final String fullResponse = await Send_RegisterUser (firstName, lastName, mNumber, email, password1, password2);
                var statusCode = fullResponse.substring(0,3);
                var responseBody = fullResponse.substring(3,);

                if (statusCode == "201")
                {
                  // display an alert box
                  displayDialogAlert(context, AlertType.success, "Success", "New User Created");
                  //save the token
                  var jwt = fullResponse.substring(3,);
                  if(jwt != null) {
                    Global().storage.write(key: "jwt", value: jwt);
                  }
                }
                else{
                  //display alert box
                  displayDialogAlert(context, AlertType.error, "Error", responseBody);
                }
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


//////////////////////////////////////////////////////////
// function to perform send request for user registration
/////////////////////////////////////////////////////////
Future<String> Send_RegisterUser (String firstName, String lastName, String mNumber, String email, String password1, String password2) async {
  //url of local database
  final String apiUrl = "http://10.0.2.2:8000/users/createuser/";
  //request body
  Map data = {
    "first_name": firstName,
    "last_name": lastName,
    "username": mNumber,
    "email": email,
    "password1": password1,
    "password2": password2
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

//////////////////////////////////////////////////////////
// function to display alert
/////////////////////////////////////////////////////////
void displayDialogAlert(BuildContext context, AlertType type, title,
    String text) {
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
        onPressed: () async => await Navigator.pop(context),
        color: Global().buttonColor,
      )
    ],
  ).show();
}

