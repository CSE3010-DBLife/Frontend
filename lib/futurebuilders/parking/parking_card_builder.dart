import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_loading.dart';
import 'package:hotel_management/futurebuilders/parking/query_result_card.dart';
import 'package:hotel_management/models/parking_summary.dart';
import 'package:hotel_management/services/parkingSummaryQuery.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:hotel_management/utilities/statusWorker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

ParkingSummaryQuery _parkingSummaryQuery = ParkingSummaryQuery();

class ParkingCardBuilder extends StatefulWidget {
  @override
  _ParkingCardBuilderState createState() => _ParkingCardBuilderState();
}

class _ParkingCardBuilderState extends State<ParkingCardBuilder> {
  final int netParkingLot = 500;
  String targetId = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<ParkingSummary>(
        future: _parkingSummaryQuery.getParkingSummary(),
        builder: (context, AsyncSnapshot<ParkingSummary> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return ReusableLoading();
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text(
                '주차 정보가 없습니다',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            );
          }
          final _data = snapshot.data;
          print((int.parse(_data.parkingStatus) / netParkingLot * 100) / 100);
          return Column(
            children: [
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
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        _data.parkingStatus.toString() + " / " + netParkingLot.toString(),
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        (int.parse(_data.parkingStatus) / netParkingLot * 100).toString() + "%",
                                        style: Theme.of(context).textTheme.subtitle2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(StatusWorker.getParkingStatusMsg((int.parse(_data.parkingStatus) / netParkingLot * 100) / 100)),
                                  CircularPercentIndicator(
                                    radius: 60.0,
                                    lineWidth: 5.0,
                                    percent: (int.parse(_data.parkingStatus) / netParkingLot * 100) / 100,
                                    center: Text((int.parse(_data.parkingStatus) / netParkingLot * 100).toString() + "%"),
                                    progressColor: StatusWorker.getParkingStatusColor((int.parse(_data.parkingStatus) / netParkingLot * 100) / 100),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Expanded(child: QueryResultCard()),
            ],
          );
        },
      ),
    );
  }
}
