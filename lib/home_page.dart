import 'package:finance_tracker_ui/income_expense_card.dart';
import 'package:finance_tracker_ui/line_chart_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _moneySaved = 2380;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Current',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w300),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        'Balance',
                        style: TextStyle(
                            fontSize: 28.0, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    '\$8,280',
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 36.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IncomeExpenseCard(
                  cardType: CardType.Income,
                  amount: 10200,
                ),
                IncomeExpenseCard(
                  cardType: CardType.Expense,
                  amount: 1200,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 50.0),
              child: LineChartSample2(),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[500].withAlpha(120),
                      offset: Offset(10, 10),
                      spreadRadius: 1.0,
                      blurRadius: 10.0),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 26.0),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 120.0,
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Color(0xff0872FA),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[500].withAlpha(120),
                            offset: Offset(10, 10),
                            spreadRadius: 1.0,
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 110.0, top: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Congratulation!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'You have saved \$$_moneySaved \non this month.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12.0,
                    bottom: 12.0,
                    child: Container(
                      child: SvgPicture.asset(
                        'images/coin_pig.svg',
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This month',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 10.0,
              child: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      elevation: 0.0,
      leading: Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Icon(
            Icons.notifications,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
