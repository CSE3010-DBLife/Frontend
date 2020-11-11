import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/utilities/constants.dart';

class ParkingScreen extends StatefulWidget {
  @override
  _ParkingScreenState createState() => _ParkingScreenState();
}

class _ParkingScreenState extends State<ParkingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTitle(
            title: '주차 관리',
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
                                '요약',
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 16.0, 8.0),
                              child: Text(
                                '123/500 (24.6%)',
                                style: Theme.of(context).textTheme.subtitle1,
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
                                '조회',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 160,
                              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 16.0),
                              child: TextField(
                                cursorColor: Color(0xFFE7E7E7),
                                maxLength: 4,
                                maxLengthEnforced: true,
                                style: Theme.of(context).textTheme.subtitle1,
                                decoration: InputDecoration(hintText: '차량번호', hintStyle: Theme.of(context).textTheme.subtitle1, counterText: ""),
                                onChanged: (String str) {},
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: ReusableCard(
                                decoration: buttonDecoration,
                                cardChild: Center(
                                  child: Icon(Icons.search),
                                ),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: cardInnerDecoration,
                              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                              child: Text(
                                '조회 결과',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                              child: Text(
                                '정아무개\n\n18묵 1818\n\n101호 (20.11.10 ~ 20.11.10)',
                                style: Theme.of(context).textTheme.subtitle1,
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
