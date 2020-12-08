import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:hotel_management/utilities/regWorker.dart';

class ContactCard extends StatelessWidget {
  ContactCard({
    this.name,
    this.carId,
    this.phone,
    this.role,
  });
  final String name;
  final String carId;
  final String phone;
  final String role;
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
                carId == null ? '오류' : '주차 번호 : $carId',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SizedBox(width: 8),
              Text(
                role == null ? '오류' : '담당 : $role',
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
                  RegWorker.getPhoneNumber(phone),
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
