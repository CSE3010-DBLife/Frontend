import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/utilities/constants.dart';

class ContactCard extends StatelessWidget {
  ContactCard({
    this.cusName,
    this.cusParkNum,
    this.cusAddress,
    this.cusPhoneNum,
  });
  final String cusName;
  final String cusParkNum;
  final String cusAddress;
  final String cusPhoneNum;

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
                '주차 번호 : $cusParkNum',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 8),
              Text(
                cusAddress,
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
                  cusPhoneNum,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8.0),
                child: Text(
                  cusName,
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
