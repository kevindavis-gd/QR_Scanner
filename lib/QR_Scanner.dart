import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:qr_scanner/Login.dart';



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      */
       
      body: Center(
        child: Text(
          "Here there!",
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      //create a button that has the camera icon and has the text scan.
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        //when the button is pressed
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );

        },
      ),
      //center the camera button
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  } //Widget build
} //HomePage