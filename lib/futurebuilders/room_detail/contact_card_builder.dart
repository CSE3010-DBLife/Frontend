import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/utilities/constants.dart';

class ContactCardBuilder extends StatelessWidget {
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
                  '예약대표 연락처',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 8),
              Text(
                '주차 번호 : 07 누 7777',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 8),
              Text(
                '경기도 안산시 상록구 사3동 한양대학로 55',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: cardInnerDecoration,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '010 - 7777 - 7777',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8.0),
                child: Text(
                  '유진웅',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
