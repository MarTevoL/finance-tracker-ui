import 'package:flutter/material.dart';

enum CardType { Income, Expense }

class IncomeExpenseCardData {
  IncomeExpenseCardData(this.title, this.icon);
  final String title;
  final IconData icon;
}

class IncomeExpenseCard extends StatelessWidget {
  const IncomeExpenseCard({
    Key key,
    this.cardType,
    this.amount,
  }) : super(key: key);

  final CardType cardType;
  final int amount;

  static Map<CardType, IncomeExpenseCardData> _cardData = {
    CardType.Income: IncomeExpenseCardData('Income', Icons.monetization_on),
    CardType.Expense: IncomeExpenseCardData('Expense', Icons.money_off),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        border: Border.all(width: 0.5, color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                _cardData[cardType].title,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                cardType == CardType.Income ? '\$$amount' : '-\$$amount',
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            width: 28.0,
          ),
          Icon(_cardData[cardType].icon)
        ],
      ),
    );
  }
}
