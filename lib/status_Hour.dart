/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_scanner/Home_Page.dart';
import 'dart:math';
import 'Global.dart';

class statusHour extends StatelessWidget {
   List<charts.Series> seriesList;
   bool animate;
   int previousDay;

  //statusHour(this.seriesList, this.animate, this.previousDay);

  statusHour.withSampleData(int pDay )
  {
    previousDay = pDay;
    seriesList = _createSampleData();
  }

  @override
  Widget build(BuildContext context) {

    String today = DateFormat('EEE, M/d/y').format(DateTime.now().subtract(Duration(days:previousDay)));

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
  static List<charts.Series<GymActivity, String>> _createSampleData() {

    var rng = new Random();

    final data = [


      new GymActivity("5", rng.nextInt(100)),
      new GymActivity("6", rng.nextInt(100)),
      new GymActivity("7", rng.nextInt(100)),
      new GymActivity("8", rng.nextInt(100)),
      new GymActivity("9", rng.nextInt(100)),
      new GymActivity("10", rng.nextInt(100)),
      new GymActivity("11", rng.nextInt(100)),
      new GymActivity("12", rng.nextInt(100)),
      new GymActivity("13", rng.nextInt(100)),
      new GymActivity("14", rng.nextInt(100)),
      new GymActivity("15", rng.nextInt(100)),
      new GymActivity("16", rng.nextInt(100)),
      new GymActivity("17", rng.nextInt(100)),
      new GymActivity("18", rng.nextInt(100)),
      new GymActivity("19", rng.nextInt(100)),
      new GymActivity("20", rng.nextInt(100)),
      new GymActivity("21", rng.nextInt(100)),
      new GymActivity("22", rng.nextInt(100)),
    

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
  String getDate()
  {
    return date;
  }
}
