/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import "status_Hour.dart";
import "package:qr_scanner/Global.dart";

// test chart with random data used until backend is complete

String fullResponse;

class SimpleBarChart extends StatefulWidget {
  @override

  State createState() => new SimpleBarChartState();
}

class SimpleBarChartState extends State<SimpleBarChart> {
  var _result;
  List<charts.Series> seriesList;
  bool animate;


  @override
  void initState() {
    _createSampleData().then((result) {
      setState(() {
        _result = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    /*
                    updatedListener: (model) {
                      print('updatedListener in $model');
                    },
                    */
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((0))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((1))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((2))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((3))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((4))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((5))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((6))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((7))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((8))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((9))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((10))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((11))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((12))),
                          );
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

                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => statusHour.withSampleData((13))),
                          );
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

  /// Create one series with sample hard coded data.
  static List<charts.Series<GymActivity, String>> _createSampleData() {
    var today = new DateTime.now();
    var rng = new Random();

    final data = [
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 0))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 1))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 2))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 3))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 4))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 5))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 6))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 7))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 8))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 9))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 10))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 11))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 12))),
          rng.nextInt(100)),
      new GymActivity(
          DateFormat('dd').format(today.subtract(Duration(days: 13))),
          rng.nextInt(100)),
    ];
    return [
      new charts.Series<GymActivity, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (GymActivity sales, _) => sales.date,
        measureFn: (GymActivity sales, _) => sales.people,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class GymActivity {
  String date;
  var people;

  GymActivity(this.date, this.people);

  String getDate() {
    return date;
  }
}





