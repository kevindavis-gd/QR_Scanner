import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Status extends StatelessWidget {
  final double barWidth = 10;

  @override
  Widget build(BuildContext context) =>

      Padding(
        padding: EdgeInsets.fromLTRB(2.0, 50,  2.0, 2.0),
        child: BarChart(

          BarChartData(
            alignment: BarChartAlignment.center,
            maxY: 120,
            minY: 0,
            groupsSpace: 15,
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              topTitles: BarTitles.getTopBottomTitles(),
              bottomTitles: BarTitles.getTopBottomTitles(),
              leftTitles: BarTitles.getSideTitles(),
              rightTitles: BarTitles.getSideTitles(),
            ),
            gridData: FlGridData(
              checkToShowHorizontalLine: (value) => value % BarData.interval == 0,
              getDrawingHorizontalLine: (value) {
                if (value == 0) {
                  return FlLine(
                    color: const Color(0xff363753),
                    strokeWidth: 3,
                  );
                } else {
                  return FlLine(
                    color: const Color(0xff2a2747),
                    strokeWidth: 0.8,
                  );
                }
              },
            ),
            barGroups: BarData.barData
                .map(
                  (data) => BarChartGroupData(
                    x: data.id,
                    barRods: [
                      BarChartRodData(
                        y: data.y,
                        width: barWidth,
                        colors: [data.color],
                        borderRadius: data.y > 0
                            ? BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              )
                            : BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6),
                              ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      );
}

//******************************************************************************
class BarData {
  static int interval = 10;

  static List<Data> barData = [
    Data(
      id: 0,
      name: 'Mon',
      y: 100,
      color: Color(0xff19bfff),
    ),
    Data(
      name: 'Tue',
      id: 1,
      y: 12,
      color: Color(0xffff4d94),
    ),
    Data(
      name: 'Wed',
      id: 2,
      y: 11,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Thu',
      id: 3,
      y: 10,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Fri',
      id: 4,
      y: 5,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Sat',
      id: 5,
      y: 17,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Sun',
      id: 6,
      y: 5,
      color: Color(0xffff4d94),
    ),
    Data(
      id: 0,
      name: 'Mon',
      y: 100,
      color: Color(0xff19bfff),
    ),
    Data(
      name: 'Tue',
      id: 1,
      y: 12,
      color: Color(0xffff4d94),
    ),
    Data(
      name: 'Wed',
      id: 2,
      y: 11,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Thu',
      id: 3,
      y: 10,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Fri',
      id: 4,
      y: 5,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Sat',
      id: 5,
      y: 17,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Sun',
      id: 6,
      y: 5,
      color: Color(0xffff4d94),
    ),
  ];
}

//******************************************************************************
class Data {
  // for ordering in the graph
  final int id;
  final String name;
  final double y;
  final Color color;

  const Data({
    @required this.name,
    @required this.id,
    @required this.y,
    @required this.color,
  });
}

//*****************************************************************************

class BarTitles {
  static SideTitles getTopBottomTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Colors.white, fontSize: 15),
        rotateAngle: 90,
        margin: 0,
        reservedSize: 50,
        getTitles: (double id) => BarData.barData
            .firstWhere((element) => element.id == id.toInt())
            .name,
      );

  static SideTitles getSideTitles() => SideTitles(
        showTitles: true,
        getTextStyles: (value) =>
            const TextStyle(color: Colors.white, fontSize: 10),
        rotateAngle: 0,
        interval: BarData.interval.toDouble(),
        margin: 10,
        reservedSize: 16,
        getTitles: (double value) => value == 0 ? '0' : '${value.toInt()}',
      );
}
