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
<<<<<<< Updated upstream
              onPressed: () {
                print("you clicked login");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
=======
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
                    displayDialogAlert(context, AlertType.success, "Success", "New User Created");

                  //save the token
                  var jwt = fullResponse.substring(3,);
                  if(jwt != null) {
                    Global().storage.write(key: "jwt", value: jwt);
                    Global().StrToken = jwt;
                    }
                  }
                else{
                  displayDialogAlert(context, AlertType.error, "Error", responseBody);
                }
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======


// function to perform post request
//****************************************************************************
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
  String body = json.encode(data);
  final response = await http.post(
    apiUrl, headers: {"Content-Type": "application/json"}, body: body,);
  print(response.body);
  print(response.statusCode.toString());
  //first 3 char is the response code
  String fullResponse = response.statusCode.toString() + response.body;
  return fullResponse;
}

// alert dialog box function
//****************************************************************************
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

>>>>>>> Stashed changes
