import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// this class contains golbal values
class Global {
   Color backgroundColor = Colors.white;
   Color buttonColor = Colors.red;
   Color textColor1 = Colors.red;
   Color textColor2 = Colors.white;
   String profilePicture = "assets/Semeion.jpg";
   String logo = "assets/Semeion.jpg";
   final storage = FlutterSecureStorage();
   final username = FlutterSecureStorage();
}