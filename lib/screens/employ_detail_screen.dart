import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/futurebuilders/employ_detail/contact_card_builder.dart';
import 'package:hotel_management/futurebuilders/employ_detail/detail_card_builder.dart';
import 'package:hotel_management/utilities/constants.dart';

class EmployDetailScreen extends StatefulWidget {
  @override
  _EmployDetailScreenState createState() => _EmployDetailScreenState();
}

class _EmployDetailScreenState extends State<EmployDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTitle(title: '직원 상세정보'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  ReusableStatus(color: statusRed),
                  SizedBox(width: 25),
                  Text(
                    '결근',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            ContactCardBuilder(),
            SizedBox(height: 16),
            DetailCardBuilder(),
          ],
        ),
      ),
    );
  }
}
