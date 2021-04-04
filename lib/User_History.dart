import "package:flutter/material.dart";
import 'package:qr_scanner/Global.dart';
import "package:http/http.dart" as http;
import 'dart:convert' show json, base64, ascii;
import 'dart:convert';

String fullResponse;

///////////////////////////////////////////////////////////////////
//Stateful widget to call the new state
///////////////////////////////////////////////////////////////////
class User_History extends StatefulWidget {
  @override
  State createState() => new User_HistoryState();
}


///////////////////////////////////////////////////////////////////
//State of the page
///////////////////////////////////////////////////////////////////
class User_HistoryState extends State<User_History> {
  var _result;
  @override
  void initState() {
    Send_HistoryRequest().then((result) {
      setState(() {
        _result = result;
        print(_result);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      // This is what we show while we're loading
      return new Container();
    }
    else
      {
      //once the information has loaded
      List data = jsonDecode(fullResponse.substring(3,));
      return Scaffold(
        appBar: AppBar(
          title: Text("User History"),
          backgroundColor: Global().buttonColor,
        ),
        //do not resize the elements when the keyboard is open
        resizeToAvoidBottomPadding: false,
        backgroundColor: Global().backgroundColor,
        body: Padding(
          //padding on all sides
          padding: const EdgeInsets.all(40.0),
          //creating a list of list tiles
          child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                  color: Global().buttonColor,
                  //create the list tile specification
                  child: ListTile(
                    title: Text(data[index]['mustangsID'],
                        style: TextStyle(
                            color: Global().textColor2,
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      data[index]['room'].toString(),
                      style: TextStyle(color: Global().textColor2),
                    ),
                    trailing: Text(
                      data[index]['scanDate'] + "\n" + data[index]['checkInTime'].toString(),
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

///////////////////////////////////////////////////////////////////
//function to request the History of user
///////////////////////////////////////////////////////////////////
Future<String> Send_HistoryRequest() async {
  //get the token information from the secure storage
  String gettoken =await Global().username.read(key: "jwt");
  String token = gettoken.substring(10,50);
  //url of local database
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
  return fullResponse;
}
