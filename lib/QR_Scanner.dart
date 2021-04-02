import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_scanner/Global.dart';
import "package:http/http.dart" as http;

import 'dart:convert' show json, base64, ascii;

class QR_Scanner extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<QR_Scanner> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
    super.initState();
  }

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
    });

    //if _scanBarcode is -1 that means it was unsuccessful
    // so do not send information to the database
    if(_scanBarcode != "-1")
    {
      SendQR(_scanBarcode);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Global().backgroundColor,
      //resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //*************************first Element *********************
              //add space between text boxes
              SizedBox(height: 40.0),
              Image(
                image: AssetImage(Global().logo),
                width: 200,
                height: 200,
              ),
              //*************************Second Element *********************
              //add space between text boxes
              SizedBox(height: 120.0),
              SizedBox(
                width: 150.0,
                height: 50.0,
                child: RaisedButton(
                  textColor: Global().textColor2,

                  onPressed: () async {
                    //print(await Global().storage.read(key: "jwt"));

                    scanQR();
                    print("start");
                    SendQR(_scanBarcode);
                    print("finish");
                    },
                  child: Text("Start QR scan"),
                  color: Global().buttonColor,
                ),
              ),
              //***********************Third Element **********************
              SizedBox(height: 20.0),
              Text('Scan result : $_scanBarcode\n',
                  style: TextStyle(fontSize: 20))
            ],
          ),
        ),
      ),
    );
  }
}


Future<void> SendQR (String QR) async {
  final String apiUrl = "http://127.0.0.1:8000/api/checkin/scan/";
  String gettoken =await Global().username.read(key: "jwt");
  String token = gettoken.substring(10,50);
  final response = await http.post(
      apiUrl,
      headers: {"Authorization" : "Token 9d1caef065038bd1ed78f7a162c32a45e6e3c24c"},
      body:{
    "mustangsID": Global().StrUsername,
    "roomID": '1',
  });

  if(response.statusCode == 201)
  {
    print("pass");
    return response.body ;

  }
  else
  {
    print("fail");
    print (response.statusCode);
    return "error";
  }

}