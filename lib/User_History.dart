import "package:flutter/material.dart";
import 'package:qr_scanner/Global.dart';
import "package:http/http.dart" as http;
import 'dart:convert' show json, base64, ascii;
import 'dart:convert';

String fullResponse;

class User_History extends StatefulWidget {
  @override
  State createState() => new User_HistoryState();
}

class User_HistoryState extends State<User_History> {
  var _result;
  @override
  void initState() {
    Send_HistoryRequest().then((result) {
      setState(() {
        _result = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      // This is what we show while we're loading
      return new Container();
    } else {
      List data = jsonDecode(fullResponse.substring(3,));
      data.forEach((element) {
        Map obj = element;
        String mustangsID = obj['mustangsID'];
        String buildingID = obj['buildingID'];
        String scanTime = obj['scanTime'];
        String scanDate = obj['scanDate'];
      });

      return Scaffold(
        appBar: AppBar(
          title: Text("Checkin List"),
          backgroundColor: Global().buttonColor,
        ),
        //do not resize the elements when the keyboard is open
        resizeToAvoidBottomPadding: false,
        backgroundColor: Global().backgroundColor,

        body: Padding(
          //padding on all sides
          padding: const EdgeInsets.all(40.0),
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                  color: Global().buttonColor,
                  child: ListTile(
                    title: Text(data[0]['mustangsID'],
                        style: TextStyle(
                            color: Global().textColor2,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      data[index]['buildingID'],
                      style: TextStyle(color: Global().textColor2),
                    ),
                    trailing: Text(
                      data[index]['scanDate'] + "\n" + data[index]['scanTime'].toString().substring(0, 5),
                      style: TextStyle(color: Global().textColor2),
                    ),
                  ));
            },
          ),
        ),
      );
    }
  }
}

// function to perform post request
// ****************************************************************************
Future<String> Send_HistoryRequest() async {
  //url of local database
  String gettoken =await Global().username.read(key: "jwt");
  String token = gettoken.substring(10,50);

  final String apiUrl = "http://10.0.2.2:8000/api/checkin/getcheckins";
  final response = await http.get(
    apiUrl,
    headers: {
      "Authorization": "Token " + token
    },
  );
  print(response.body);
  print(response.statusCode);
  //first 3 char is the response code
  fullResponse = response.statusCode.toString() + response.body;
  //List data = jsonDecode(response.body);
  return fullResponse;
}
