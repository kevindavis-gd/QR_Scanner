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
import 'package:qr_scanner/status_Hour2.dart';
import 'dart:io';

String fullResponse = '200[0,0,0,0,0,0,0,0,0,0,0,0,0,0]';


class Status_Date extends StatefulWidget {
  String myData;
  Status_Date(this.myData, {Key key}) : super(key: key);

  @override
  State createState() => new Status_DateState.withSampleData(myData);
}
//************************************************************************************
class Status_DateState extends State<Status_Date> {
  var _result;
  List<charts.Series> seriesList;
  bool animate;
  Status_DateState (this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory Status_DateState.withSampleData(String response) {
    return new Status_DateState(
      _createSampleData(response),
      animate: true,
    );
  }
  //***********************************************************************************
  @override
  void initState() {
      setState(() {
        _result = widget.myData;
      });
  }
//****************************************************************************************
  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      // This is what we show while we're loading
      return new Container();
    }
    int previousDay = 0;
    double buttonSize = 16;
    double buttonSpacing =10;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("People at The Gym"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 550,
              child: charts.BarChart(
                seriesList, animate: animate,

                /// ********************************************************************Add Labels to Chart
                behaviors: [
                  new charts.ChartTitle(
                    'Day of The Month',
                    behaviorPosition: charts.BehaviorPosition.top,
                    titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
                  )
                ],

                /// ********************************************************************Select individual bars

                selectionModels: [
                  new charts.SelectionModelConfig(
                    type: charts.SelectionModelType.info,
                    changedListener: (model) {
                      previousDay = model.selectedDatum.first.index;
                      print(previousDay);
                    },
                  ),
                ],
              ),
            ),
            //**********************************************************
            // ***************************************************************Buttons for hourly graph
            //
            Padding(
              padding: const EdgeInsets.fromLTRB(21, 2, 2, 0),
              child: SizedBox(
                //a row of buttons
                child: Row(
                  children: [
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");
                          Send_HourStatusRequest(context, "00");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          Send_HourStatusRequest(context, "01");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");
                          Send_HourStatusRequest(context, "02");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");
                          Send_HourStatusRequest(context, "03");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");
                          Send_HourStatusRequest(context, "04");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");
                          Send_HourStatusRequest(context, "05");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");
                          Send_HourStatusRequest(context, "06");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");

                          Send_HourStatusRequest(context, "07");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");

                          Send_HourStatusRequest(context, "08");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");

                          Send_HourStatusRequest(context, "09");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");

                          Send_HourStatusRequest(context, "10");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");
                          Send_HourStatusRequest(context, "11");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");

                          Send_HourStatusRequest(context, "12");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                    SizedBox(width:buttonSpacing,),
                    SizedBox(
                      width:buttonSize,
                      child: RaisedButton(
                        textColor: Global().textColor2,
                        onPressed: () {
                          print("you clicked QR code");

                          Send_HourStatusRequest(context, "13");
                        },
                        child: Text("M"),
                        color: Global().buttonColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
//**************************************************************************************
  /// Create one series with sample hard coded data.
  /// // ****************************************************************************
  static List<charts.Series<GymActivity, String>> _createSampleData(String response)  {
    var today = new DateTime.now();
    List dateData = jsonDecode(response.substring(3,));
    final data = [
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 0))),
          dateData[0]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 1))),
          dateData[1]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 2))),
          dateData[2]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 3))),
          dateData[3]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 4))),
          dateData[4]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 5))),
          dateData[5]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 6))),
          dateData[6]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 7))),
          dateData[7]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 8))),
          dateData[8]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 9))),
          dateData[9]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 10))),
          dateData[10]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 11))),
          dateData[11]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 12))),
          dateData[12]),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 13))),
          dateData[13]),
    ];
    return [
      new charts.Series<GymActivity, String>(
        id: 'People',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (GymActivity people, _) => people.date,
        measureFn: (GymActivity people, _) => people.people,
        data: data,
      )
    ];
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
void Send_HourStatusRequest(BuildContext context, String previousDay) async {
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
  fullResponse = previousDay.toString() + response.body;

  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            Status_Hour(fullResponse)),
  );
}