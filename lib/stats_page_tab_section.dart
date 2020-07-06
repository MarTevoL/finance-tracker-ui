import 'package:flutter/material.dart';

class StatsPageTabSection extends StatefulWidget {
  @override
  _StatsPageTabSectionState createState() => _StatsPageTabSectionState();
}

class _StatsPageTabSectionState extends State<StatsPageTabSection>
    with TickerProviderStateMixin {
  TabController _nestedTabController;
  static const Color bgColor = Color(0xff0872FA);

  @override
  void initState() {
    _nestedTabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _nestedTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TabBar(
              controller: _nestedTabController,
              indicator: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(12.0)),
              labelColor: Colors.white,
              labelStyle: TextStyle(color: Colors.white, fontSize: 20.0),
              unselectedLabelColor: Colors.black38,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  text: 'All',
                ),
                Tab(
                  text: "Income",
                ),
                Tab(
                  text: "Expense",
                ),
              ],
            ),
          ),
          Container(
            height: 200.0,
            margin: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _nestedTabController,
              children: <Widget>[
                StatsFinanceTab(),
                StatsFinanceTab(),
                StatsFinanceTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatsFinanceTab extends StatelessWidget {
  const StatsFinanceTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            StatsIncomeExpenseCard(
              icon: Icons.beach_access,
              title: 'Vacation',
              date: '5 Dec',
              amount: 280,
              color: Colors.blueAccent,
            ),
            StatsIncomeExpenseCard(
              icon: Icons.weekend,
              title: 'Home',
              date: '10 Dec',
              amount: 620,
              color: Colors.greenAccent,
            ),
            StatsIncomeExpenseCard(
              icon: Icons.videogame_asset,
              title: 'Games',
              date: '8 Dec',
              amount: 120,
              color: Colors.orangeAccent,
            ),
          ],
        ),
      ),
    );
  }
}

class StatsIncomeExpenseCard extends StatelessWidget {
  const StatsIncomeExpenseCard({
    Key key,
    this.icon,
    this.title,
    this.date,
    this.amount,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String date;
  final double amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128.0,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 36.0,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
          ),
          Text(
            date,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('\$${amount.toString()}',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
