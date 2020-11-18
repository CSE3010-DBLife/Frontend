import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/utilities/constants.dart';

class DetailCardBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      decoration: cardDecoration,
      cardChild: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: cardInnerDecoration,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  '세부사항',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 4.0),
                          child: Text(
                            '18형/트윈 베드/800,000원',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
