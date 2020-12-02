import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/futurebuilders/parking/query_result_card.dart';
import 'package:hotel_management/models/parking_summary.dart';
import 'package:hotel_management/services/parkingSummaryQuery.dart';
import 'package:hotel_management/utilities/constants.dart';

ParkingSummaryQuery _parkingSummaryQuery = ParkingSummaryQuery();

class ParkingCardBuilder extends StatefulWidget {
  @override
  _ParkingCardBuilderState createState() => _ParkingCardBuilderState();
}

class _ParkingCardBuilderState extends State<ParkingCardBuilder> {
  final int netParkingLot = 500;
  String targetId = "";
  TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ParkingSummary>(
      future: _parkingSummaryQuery.getParkingSummary(),
      builder: (context, AsyncSnapshot<ParkingSummary> snapshot) {
        if (snapshot.data == null || !snapshot.hasData) {
          return Center(
            child: Text(
              '주차 정보가 없습니다',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        }

        final _data = snapshot.data;
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
                                  child: Text(
                                      _data.parkingStatus.toString() +
                                          "/" +
                                          netParkingLot.toString() +
                                          " (" +
                                          (int.parse(_data.parkingStatus) / netParkingLot * 100).toString() +
                                          "%)",
                                      style: Theme.of(context).textTheme.subtitle1))
                            ],
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16.0),
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
                                  controller: textEditingController,
                                  cursorColor: Color(0xFFE7E7E7),
                                  style: Theme.of(context).textTheme.subtitle1,
                                  decoration: InputDecoration(hintText: '차량번호', hintStyle: Theme.of(context).textTheme.subtitle1, counterText: ""),
                                  onChanged: (String str) {
                                    targetId = str;
                                    setState(() {});
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {});
                                },
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
            SizedBox(height: 20),
            QueryResultCard(carId: targetId ?? ""),
          ],
        );
      },
    );
  }
}
