import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/utilities/constants.dart';

class MemberCard extends StatelessWidget {
  MemberCard({this.adultCount, this.teenCount});
  final String adultCount;
  final String teenCount;

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
                  '구성원',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: cardInnerDecoration,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '성인',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            adultCount ?? "오류",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Container(
                  decoration: cardInnerDecoration,
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '미성년자',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            teenCount ?? "오류",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
