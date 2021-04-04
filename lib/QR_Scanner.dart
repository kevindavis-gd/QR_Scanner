import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/Global.dart';
import "package:http/http.dart" as http;

///////////////////////////////////////////////////////////////////
//Stateful widget to call the new state
///////////////////////////////////////////////////////////////////
class QR_Scanner extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

///////////////////////////////////////////////////////////////////
//State of the page
///////////////////////////////////////////////////////////////////
class _MyAppState extends State<QR_Scanner> {
  //initially set the value to unknown
  String _scanBarcode = 'Unknown';
  @override
  void initState() {super.initState();}

  //start of the actual gui/widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //do not resize widgets when the keyboard opens
      resizeToAvoidBottomPadding: false,
      backgroundColor: Global().backgroundColor,
      body: Padding(
        //padding on all sides
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            //an array that stores multiple widgets
            children: <Widget>[
              //*************************Logo Image *********************
              //add space between text boxes
              SizedBox(height: 40.0),
              Image(
                image: AssetImage(Global().logo),
                width: 200,
                height: 200,
              ),
              //*************************QR Scan Button *********************
              //add space between text boxes
              SizedBox(height: 120.0),
              SizedBox(
                width: 150.0,
                height: 50.0,
                child: RaisedButton(
                  textColor: Global().textColor2,
                  onPressed: () async {
                    //call the scanQR function
                    scanQR();
                    },
                  child: Text("Start QR scan"),
                  color: Global().buttonColor,
                ),
              ),
              //***********************Display the results of the scan in text **********************
              SizedBox(height: 20.0),
              Text('Scan result : $_scanBarcode\n',
                  style: TextStyle(fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }

  ///////////////////////////////////////////////////////////////////
  //function to perform the QR Scan
  ///////////////////////////////////////////////////////////////////
  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _scanBarcode = barcodeScanRes;
      //if _scanBarcode is -1 that means it was unsuccessful
      // so do not send information to the database
      if(_scanBarcode != "-1")
      {
        SendQR(_scanBarcode);
      }
    });
  }
}//_MyAppState


///////////////////////////////////////////////////////////////////
//function to send the information to backend
///////////////////////////////////////////////////////////////////
Future<void> SendQR (String QR) async {

  //get the token information from the secure storage
  String gettoken =await Global().storage.read(key: "jwt");
  String token = gettoken.substring(10,50);
  String username = await Global().storage.read(key: "username");
  //url of local database
  final String apiUrl = "http://10.0.2.2:8000/api/checkin/scan/";
  final response = await http.post(
      apiUrl,
      headers: {"Authorization": "Token " + token},
      body:{
        "mustangsID": username,
        "room": QR} //needs to be changed to equipment ID
  );
  print(response.body);
}