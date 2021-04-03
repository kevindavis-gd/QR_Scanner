/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import "status_Hour.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import 'dart:convert' show json, base64, ascii;
import 'dart:convert';
import 'package:qr_scanner/Global.dart';
import 'package:qr_scanner/Home_Page.dart';

String fullResponse;
//List dateData = [];

class Status_Hour extends StatefulWidget {
  @override
  State createState() => new Status_HourState();
}
//************************************************************************************
class Status_HourState extends State<Status_Hour> {
  var _result;
  //***********************************************************************************
  @override
  void initState() {
    Send_DateStatusRequest().then((result) {
      setState(() {
        _result = result;
        print(_result);
      });
    });
  }
//****************************************************************************************
  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      // This is what we show while we're loading
      return new Container();
    } else {
      List dateData = jsonDecode(fullResponse.substring(3,));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("People at The Gym"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}














// ****************************************************************************
/// Sample data type.
class GymActivity {
  String date;
  var people;
  GymActivity(this.date, this.people);
  String getDate() {
    return date;
  }
}
// function to perform post request
// ****************************************************************************
Future<String> Send_DateStatusRequest() async {
  //url of local database
  String gettoken =await Global().username.read(key: "jwt");
  String token = gettoken.substring(10,50);
  final String apiUrl = "http://10.0.2.2:8000/api/checkin/getHourStatus";
  final response = await http.get(
    apiUrl,
    headers: {
      "Authorization": "Token " + token
    },
  );
  fullResponse = response.statusCode.toString() + response.body;
  //print(fullResponse);
  return fullResponse;
}