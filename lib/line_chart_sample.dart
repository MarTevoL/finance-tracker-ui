import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    const Color(0xffF5A71A),
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
                color: Colors.grey),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 26.0, left: 20.0, top: 12.0, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.w500,
              fontSize: 12),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1st week';
              case 5:
                return '2nd week';
              case 9:
                return '3rd week';
            }
            return '';
          },
          reservedSize: 16,
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: const TextStyle(
            color: Color(0xff67727d),
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '\$1k';
              case 2:
                return '\$2k';
              case 3:
                return '\$3k';
              case 4:
                return '\$4k';
              case 5:
                return '\$5k';
            }
            return '';
          },
          reservedSize: 16,
          margin: 10,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border(
            left: BorderSide(width: 0.5),
            bottom: BorderSide(width: 0.5),
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
            getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(
              radius: 6.0,
              strokeWidth: 2.0,
              color: Colors.orange,
              strokeColor: Colors.white,
            ),
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.1)).toList(),
          ),
        ),
      ],
    );
  }
}
