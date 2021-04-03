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
  String fullData;
  Status_Hour(this.fullData, {Key key}) : super(key: key);

  @override
  State createState() => new Status_HourState.withSampleData(fullData);
}
//************************************************************************************
class Status_HourState extends State<Status_Hour> {

  var _result;
  List<charts.Series> seriesList;
  bool animate;
  Status_HourState (this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory Status_HourState.withSampleData(String fullData) {

    int previousDays = int.parse(fullData.substring(0,2));
    String response = fullData.substring(2,);

    return new Status_HourState(
      _createSampleData(response, previousDays),
      animate: true,
    );
  }
  //***********************************************************************************
  @override
  void initState() {
    setState(() {
      _result = widget.fullData.substring(2,);
    });
  }
//****************************************************************************************
  @override
  Widget build(BuildContext context) {
    if (_result == null) {
      // This is what we show while we're loading
      return new Container();
    } else {
      //List dateData = jsonDecode(fullResponse.substring(3,));
    }

    String today = DateFormat('EEE, M/d/y').format(DateTime.now().subtract(Duration(days:int.parse(widget.fullData.substring(0,2)))));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("People at Hours"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 500,
              child: charts.BarChart(
                seriesList, animate: animate,

                /// ********************************************************************Add Labels to Chart
                behaviors: [
                  new charts.ChartTitle(
                    today,
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
                      //print('Change in ${model.selectedDatum.first.datum}');
                      print(model.selectedDatum.first.index);

                    },
                    /*
                    updatedListener: (model) {
                      print('updatedListener in $model');
                    },*/
                  ),
                ],
              ),
            ),
            SizedBox(width:70,),
            SizedBox(
              width:200,
              child: RaisedButton(
                textColor: Global().textColor2,
                onPressed: () {
                  print("you clicked QR code");

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home_Page()),
                  );
                },
                child: Text("Return to Home"),
                color: Global().buttonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<GymActivity, String>> _createSampleData(String response, int previousDays) {
    var lists = json.decode(response);
    print(lists[0][1]);
    print(previousDays);
    final data = [
      new GymActivity("5", lists[previousDays][5]),
      new GymActivity("6", lists[previousDays][6]),
      new GymActivity("7", lists[previousDays][7]),
      new GymActivity("8", lists[previousDays][8]),
      new GymActivity("9", lists[previousDays][9]),
      new GymActivity("10", lists[previousDays][10]),
      new GymActivity("11", lists[previousDays][11]),
      new GymActivity("12", lists[previousDays][12]),
      new GymActivity("13", lists[previousDays][13]),
      new GymActivity("14", lists[previousDays][14]),
      new GymActivity("15", lists[previousDays][15]),
      new GymActivity("16", lists[previousDays][16]),
      new GymActivity("17", lists[previousDays][14]),
      new GymActivity("18", lists[previousDays][18]),
      new GymActivity("19", lists[previousDays][19]),
      new GymActivity("20", lists[previousDays][20]),
      new GymActivity("21", lists[previousDays][21]),
      new GymActivity("22", lists[previousDays][22]),

    ];
    return [
      new charts.Series<GymActivity, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (GymActivity sales, _) => sales.hour,
        measureFn: (GymActivity sales, _) => sales.people,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class GymActivity {
  String hour;
  var people;

  GymActivity(this.hour, this.people);
  String getDate()
  {
    return hour;
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