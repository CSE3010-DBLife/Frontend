import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/utilities/constants.dart';

class RoomDetailScreen extends StatefulWidget {
  @override
  _RoomDetailScreenState createState() => _RoomDetailScreenState();
}

class _RoomDetailScreenState extends State<RoomDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTitle(title: '방 101호 상세정보'),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  ReusableStatus(color: statusRed),
                  SizedBox(width: 25),
                  Text(
                    '사용중',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            ReusableCard(
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
            ),
            SizedBox(height: 16),
            ReusableCard(
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
                                    '2명',
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
                                    '2명',
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
            ),
            SizedBox(height: 16.0),
            ReusableCard(
              decoration: cardDecoration,
              cardChild: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: cardInnerDecoration,
                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Text(
                          '세부사항',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: Text(
                                    '18형/트윈 베드/800,000원',
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: ReusableCard(
                  decoration: buttonDecoration,
                  cardChild: Center(
                    child: Text(
                      '요청사항 확인',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
