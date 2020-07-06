import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample2 extends StatefulWidget {
  const LineChartSample2({Key key, this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  _LineChartSample2State createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Colors.white,
    Colors.black.withOpacity(0.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      color: Color(0xff0872FA),
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: InkWell(
                      onTap: widget.onTap,
                      child: Text(
                        'Stats',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        _buildChartTimeButton(onTap: () {}, title: 'Day'),
                        _buildChartTimeButton(onTap: () {}, title: 'Week'),
                        _buildChartTimeButton(onTap: () {}, title: 'Month'),
                      ],
                    ),
                  )
                ],
              ),
            ),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 26.0, left: 20.0, top: 12.0, bottom: 12),
                child: LineChart(
                  mainData(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildChartTimeButton({VoidCallback onTap, String title}) {
    return Container(
      alignment: Alignment.center,
      width: 60.0,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2)),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
      ),
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
              color: Colors.white70, fontWeight: FontWeight.w500, fontSize: 12),
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
            color: Colors.white70,
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
            left: BorderSide(width: 0.5, color: Colors.white),
            bottom: BorderSide(width: 0.5, color: Colors.white),
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
          colors: [Colors.white],
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
              colors: [Colors.white.withOpacity(0.6), Colors.transparent],
              gradientFrom: Offset(0.5, 0),
              gradientTo: Offset(0.5, 1),
              gradientColorStops: [0.1, 1]),
        ),
      ],
    );
  }
}
