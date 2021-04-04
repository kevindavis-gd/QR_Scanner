import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


/////////////////////////////////////////////////
// this class contains values to be used globally
/////////////////////////////////////////////////
class Global {
   Color backgroundColor = Colors.white;
   Color buttonColor = Colors.pinkAccent;
   Color textColor1 = Colors.pinkAccent;
   Color textColor2 = Colors.white;
   String profilePicture = "assets/logo.png";
   String logo = "assets/logo.png";
   final storage = FlutterSecureStorage();
   final username = FlutterSecureStorage();
   String StrToken;
   String StrUsername;
}