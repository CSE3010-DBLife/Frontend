import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/screens/employ_detail_screen.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:hotel_management/utilities/statusWorker.dart';

class EmployCard extends StatelessWidget {
  EmployCard({this.id, this.name, this.status});
  final String name;
  final String id;
  final String status;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EmployDetailScreen(employId: id, name: name);
        }));
      },
      child: ReusableCard(
        decoration: cardDecoration,
        cardChild: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: cardInnerDecoration,
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: ReusableStatus(color: StatusWorker.getEmployStatusColor(status)),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8.0, 16.0, 8.0),
                  child: Text(
                    StatusWorker.getEmployStatus(status),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
