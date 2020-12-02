import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/utilities/constants.dart';

class ContactCard extends StatelessWidget {
  ContactCard({
    this.name,
    this.carId,
    this.address,
    this.phone,
  });
  final String name;
  final String carId;
  final String address;
  final String phone;

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
                  '직원 상세 명세',
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
                '주차 번호 : $carId',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 8),
              Text(
                address,
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
                  phone,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 8.0),
                child: Text(
                  name,
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
