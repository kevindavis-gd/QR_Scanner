import "package:flutter/material.dart";
import 'Login_text_field_widget.dart';
import 'QR_Scanner.dart';
import 'package:qr_scanner/Signup.dart';
import 'package:qr_scanner/Home_Page.dart';
import "package:qr_scanner/Global.dart";
import "model_user.dart";
import 'getData.dart';
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
      resizeToAvoidBottomPadding: false,
      backgroundColor: Global().backgroundColor,
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
              image: AssetImage(Global().profilePicture),
              width: 200,
              height: 200,
            ),
            //*************************second Element *********************
            //add space between text boxes
            SizedBox(height: 40.0),

            EmailField,
            //add space between text boxes
            SizedBox(height: 10.0),
            //*************************Third Element *********************
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
                final String user = await login_User (email,name);
                print(user);

                //final UserModel user = await createUser ("john","flask");


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





  Future<String> login_User (String name, String jobTitle) async {
    final String apiUrl = "https://reqres.in/api/users";

    final response = await http.post(apiUrl, body:{
      "name": name,
      "job" : jobTitle
    });

    if(response.statusCode == 201)
    {
      return response.body ;
    }
    else
    {
      print (response.statusCode);
      return "error";
    }

  }



  /*
  Future<UserModel> createUser (String name, String jobTitle) async {
    final String apiUrl = "https://reqres.in/api/users";

    final response = await http.post(apiUrl, body:{
      "name": name,
      "job" : jobTitle
    });

    if(response.statusCode == 201)
      {
        final String responseString = response.body;
        return userModelFromJson(responseString);
      }
    else
      {
        print (response.statusCode);
        return null;
      }

  }
  */

}
