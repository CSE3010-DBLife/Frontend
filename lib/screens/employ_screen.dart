import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/utilities/constants.dart';

class EmployScreen extends StatefulWidget {
  @override
  _EmployScreenState createState() => _EmployScreenState();
}

class _EmployScreenState extends State<EmployScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTitle(
            title: '직원',
            searchIcon: Icon(Icons.search),
            searchIconOnPressed: () {},
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
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
                                '김아무개',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: ReusableStatus(color: statusGreen),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                '출근',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
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
                                '이아무개',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: ReusableStatus(color: statusGrey),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                                '휴가',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                          ],
                        ),
                      ],
                    ),
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
