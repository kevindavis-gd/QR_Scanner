/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("People at The Gym"),
        ),
        body: charts.BarChart(seriesList, animate: animate,

            /// ********************************************************************Add Labels to Chart
            behaviors: [
              new charts.ChartTitle(
                'Day of The Month',
                behaviorPosition: charts.BehaviorPosition.bottom,
                titleOutsideJustification:
                    charts.OutsideJustification.middleDrawArea,
              )
            ],

            /// ********************************************************************Select individual bars

            selectionModels: [
              new charts.SelectionModelConfig(
                type: charts.SelectionModelType.info,
                changedListener: (model) {
                  print('Change in ${model.selectedDatum.first.datum}');
                },
                updatedListener: (model) {
                  print('updatedListener in $model');
                },
              ),
            ]),
      ),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    var today = new DateTime.now();
    var rng = new Random();

    final data = [
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 0))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 1))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 2))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 3))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 4))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 5))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 6))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 7))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 8))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 9))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 10))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 11))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 12))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 13))),
          rng.nextInt(100)),
      new OrdinalSales(
          DateFormat('dd').format(today.subtract(Duration(days: 14))),
          rng.nextInt(100)),
    ];
    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
