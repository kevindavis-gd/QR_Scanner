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
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {

    var rng = new Random();

    final data = [
      /*
      new OrdinalSales("1", rng.nextInt(100)),
      new OrdinalSales("2", rng.nextInt(100)),
      new OrdinalSales("3", rng.nextInt(100)),
      new OrdinalSales("4", rng.nextInt(100)),
      */

      new OrdinalSales("5", rng.nextInt(100)),
      new OrdinalSales("6", rng.nextInt(100)),
      new OrdinalSales("7", rng.nextInt(100)),
      new OrdinalSales("8", rng.nextInt(100)),
      new OrdinalSales("9", rng.nextInt(100)),
      new OrdinalSales("10", rng.nextInt(100)),
      new OrdinalSales("11", rng.nextInt(100)),
      new OrdinalSales("12", rng.nextInt(100)),
      new OrdinalSales("13", rng.nextInt(100)),
      new OrdinalSales("14", rng.nextInt(100)),
      new OrdinalSales("15", rng.nextInt(100)),
      new OrdinalSales("16", rng.nextInt(100)),
      new OrdinalSales("17", rng.nextInt(100)),
      new OrdinalSales("18", rng.nextInt(100)),
      new OrdinalSales("19", rng.nextInt(100)),
      new OrdinalSales("20", rng.nextInt(100)),
      new OrdinalSales("21", rng.nextInt(100)),
      new OrdinalSales("22", rng.nextInt(100)),
      /*
      new OrdinalSales("23", rng.nextInt(100)),
      new OrdinalSales("24", rng.nextInt(100)),
      */
       



    ];
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.date,
        measureFn: (OrdinalSales sales, _) => sales.people,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  String date;
  var people;

  OrdinalSales(this.date, this.people);

  String getDate()
  {
    return date;
  }
}
