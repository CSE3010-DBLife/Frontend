import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/models/parking_detail.dart';
import 'package:hotel_management/services/parkingDetailQuery.dart';
import 'package:hotel_management/utilities/constants.dart';

ParkingDetailQuery _parkingDetailQuery = ParkingDetailQuery();

class QueryResultCard extends StatelessWidget {
  QueryResultCard({this.carId, this.isEmp});

  final String carId;
  final bool isEmp;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _parkingDetailQuery.getParkingDetail(carId),
      builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.data == null) {
          return Center(
            child: Text(
              '주차 정보가 없습니다',
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
                    style: Theme.of(context).textTheme.subtitle1,
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
                            style: Theme.of(context).textTheme.subtitle1,
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
                              _data['cusName'] != null ? _data['cusName'].toString() : "",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            SizedBox(width: 8),
                            Text(
                              _data['roomId'].toString() + "호",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            SizedBox(width: 8),
                            Text(
                              "체크인 : " +
                                  _data['checkInDate'][0].toString() +
                                  " 년 " +
                                  _data['checkInDate'][1].toString() +
                                  " 월 " +
                                  _data['checkInDate'][2].toString() +
                                  " 일 " +
                                  _data['checkInDate'][3].toString(),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            SizedBox(width: 8),
                            Text(
                              "체크아웃 : " +
                                  _data['checkOutDate'][0].toString() +
                                  " 년 " +
                                  _data['checkOutDate'][1].toString() +
                                  " 월 " +
                                  _data['checkOutDate'][2].toString() +
                                  " 일 " +
                                  _data['checkOutDate'][3].toString(),
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ],
                    ),
            ],
          ),
        );
      },
    );
  }
}
