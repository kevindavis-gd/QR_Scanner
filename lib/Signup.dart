import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'package:qr_scanner/Login.dart';
import 'package:qr_scanner/Global.dart';
import "package:http/http.dart" as http;
import "dart:async";
import "dart:convert";

class Signup extends StatelessWidget {

  //entire field saved into variable
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
          children: <Widget>[
            //no room for photo
            //Image(image: AssetImage(Global().logo), width: 100, height: 100,),
            //************************** Element 1************************
            SizedBox(height: 30.0),
            Container(
                child: Text(
              "SignUp",
              style: TextStyle(height: 1, fontSize: 50, color: Global().textColor1),
              ),
            ),

            //***********************Element 2***********************
            SizedBox(height: 30.0),
            firstNameField,

            //*********************Element 3*************************
            SizedBox(height: 10.0),
            lastNameField,

            //**********************Element 4************************
            SizedBox(height: 10.0),
            mNumberField,


            //*********************Element 5*************************
            SizedBox(height: 10.0),
            emailField,

            //**********************Element 6************************
            SizedBox(height: 10.0),
            passwordField1,

            //*************************Element 7 *********************
            SizedBox(height: 10.0),
            passwordField2,

            //************************* Element 8 *********************
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
                final String responseBody = await Send_RegisterUser (firstName, lastName, mNumber, email, password1, password2);
                print(responseBody);

               /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );*/
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


// function to perform post request
Future<String> Send_RegisterUser (String firstName, String lastName, String mNumber, String email, String password1, String password2) async {
  //url of local database
  final String apiUrl = "http://10.0.2.2:8000/users/createUser/";
  //request body
  Map data = {
    "first_name": firstName,
    "last_name": lastName,
    "username": mNumber,
    "email": email,
    "password1": password1,
    "password2": password2
  };
  String body = json.encode(data);
  final response = await http.post(apiUrl, headers: {"Content-Type": "application/json"}, body: body,);
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
