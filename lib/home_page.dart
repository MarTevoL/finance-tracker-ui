import 'package:finance_tracker_ui/income_expense_card.dart';
import 'package:finance_tracker_ui/line_chart_sample.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            Container(child: LineChartSample2()),
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
