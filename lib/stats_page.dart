import 'package:finance_tracker_ui/bottom_banner.dart';
import 'package:finance_tracker_ui/line_chart_sample.dart';
import 'package:finance_tracker_ui/stats_page_tab_section.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> with TickerProviderStateMixin {
  static const Color bgColor = Color(0xff0872FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.notifications,
              size: 30.0,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
              tag: 'stats_page',
              child: Container(
                child: LineChartSample2(),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  StatsPageTabSection(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: BottomBanner(
                      money: 70,
                      imageUrl: 'images/coin_pig.svg',
                      type: BannerType.warning,
                      percent: 0.7,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
