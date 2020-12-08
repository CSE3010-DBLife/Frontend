import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_loading.dart';
import 'package:hotel_management/components/reusable_textfield.dart';
import 'package:hotel_management/services/parkingDetailQuery.dart';
import 'package:hotel_management/utilities/constants.dart';

class QueryResultCard extends StatefulWidget {
  @override
  _QueryResultCardState createState() => _QueryResultCardState();
}

class _QueryResultCardState extends State<QueryResultCard> {
  ParkingDetailQuery _parkingDetailQuery = ParkingDetailQuery();
  TextEditingController carIdtextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ReusableTextField(
              title: "조회",
              textEditingController: carIdtextEditingController,
              minWidth: 100,
              maxLength: 8,
              textInputType: TextInputType.text,
              hintText: '차량 번호 입력',
              onChanged: (value) {
                setState(() {});
              },
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: FutureBuilder<Map<String, dynamic>>(
                future: _parkingDetailQuery.getParkingDetail(carIdtextEditingController.value.text),
                builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ReusableLoading();
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text(
                        '차량 조회 결과가 없습니다',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    );
                  }
                  final _data = snapshot.data;
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
                                '조회 결과',
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
                              '주차 번호 : ' + _data['carId'].toString(),
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        _data['employId'] != null
                            ? Container(
                                margin: EdgeInsets.only(bottom: 8.0),
                                child: Row(
                                  children: [
                                    SizedBox(width: 8),
                                    Text(
                                      _data['employId'] != null ? _data['employName'].toString() + " (사번:" + _data['employId'].toString() + ")" : "",
                                      style: Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ],
                                ),
                              )
                            : Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(width: 8),
                                      Text(
                                        _data['cusName'] != null ? "이름 : " + _data['cusName'].toString() : "오류",
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      SizedBox(width: 8),
                                      Text(
                                        "예약 호수 : " + _data['roomId'].toString() + "호",
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      SizedBox(width: 8),
                                      Text(
                                        "체크인 : " + _data['checkInDate'][0].toString() + " 년 " + _data['checkInDate'][1].toString() + " 월 " + _data['checkInDate'][2].toString() + " 일 " + _data['checkInDate'][3].toString() + ":" + _data['checkInDate'][4].toString(),
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    children: [
                                      SizedBox(width: 8),
                                      Text(
                                        "체크아웃 : " + _data['checkOutDate'][0].toString() + " 년 " + _data['checkOutDate'][1].toString() + " 월 " + _data['checkOutDate'][2].toString() + " 일 " + _data['checkOutDate'][3].toString() + ":" + _data['checkOutDate'][4].toString(),
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
