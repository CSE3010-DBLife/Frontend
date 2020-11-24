import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/screens/employ_detail_screen.dart';
import 'package:hotel_management/utilities/constants.dart';

class SummaryCardBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EmployDetailScreen();
              }));
            },
            child: ReusableCard(
                decoration: cardDecoration,
                cardChild: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: cardInnerDecoration,
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          '박아무개',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: ReusableStatus(color: statusRed),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    GestureDetector(
                      onTap: () {},
                      child: ReusableCard(
                        decoration: buttonDecoration,
                        cardChild: Center(
                          child: Text(
                            '연락처',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8.0, 16.0, 8.0),
                      child: Text(
                        '결근',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ]),
                ]))));
  }
}
