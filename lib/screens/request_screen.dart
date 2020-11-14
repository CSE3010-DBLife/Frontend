import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/utilities/constants.dart';

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTitle(
              title: '고객 요청사항',
            ),
            ReusableCard(
              decoration: cardDecoration,
              cardChild: Container(
                padding: EdgeInsets.all(8.0),
                width: double.maxFinite,
                child: Text(
                  '간곡한 부탁이 있습니다.\n다름이 아니오라 옆의 방 손님이 너무 시끄럽네요;;\n해결 부탁 드립니다.',
                  style: Theme.of(context).textTheme.subtitle1.copyWith(height: 2.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
