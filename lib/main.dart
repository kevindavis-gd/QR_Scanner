import 'package:flutter/material.dart';
import 'package:qr_scanner/Login.dart';


void main() {
  runApp(MaterialApp(
    //don't show the debug sign at the top of the screen
    debugShowCheckedModeBanner: false,
    //as soon as the app opens, call the login page
    home: Login(),
  )); //runApp
} //main
