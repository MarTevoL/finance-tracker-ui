import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/percent_indicator.dart';

enum BannerType {
  congrat,
  warning,
}

class BottomBanner extends StatelessWidget {
  const BottomBanner(
      {Key key, this.money, this.imageUrl, this.type, this.percent})
      : super(key: key);
  final int money;
  final String imageUrl;
  final BannerType type;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  type == BannerType.congrat
                      ? Text(
                          'Congratulation!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 3.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                12.0,
                              ),
                              color: Colors.white),
                          child: Text(
                            'Warning!',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                  SizedBox(
                    height: 8.0,
                  ),
                  type == BannerType.congrat
                      ? Text(
                          'You have saved \$$money \non this month.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      : Text(
                          'You spend $money% on your\nmonthly financial plan.',
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
              child: type == BannerType.congrat
                  ? SvgPicture.asset(
                      imageUrl,
                      height: 150.0,
                      width: 150.0,
                    )
                  : CircularPercentIndicator(
                      radius: 90.0,
                      lineWidth: 10.0,
                      percent: percent,
                      center: Text(
                        '${(percent * 100).floor()}%',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      progressColor: Colors.yellowAccent,
                      backgroundColor: Colors.white.withAlpha(60),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
