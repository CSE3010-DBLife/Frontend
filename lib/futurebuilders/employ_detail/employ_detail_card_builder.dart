import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_loading.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/futurebuilders/employ_detail/contact_card.dart';
import 'package:hotel_management/models/employ_detail.dart';
import 'package:hotel_management/services/employDetailQuery.dart';
import 'package:hotel_management/utilities/statusWorker.dart';

EmployDetailQuery _employDetailQuery = EmployDetailQuery();

class EmployDetailCardBuilder extends StatelessWidget {
  EmployDetailCardBuilder(this.employId);
  final String employId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EmployDetail>(
      future: _employDetailQuery.getEmployData(employId),
      builder: (context, AsyncSnapshot<EmployDetail> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return ReusableLoading();
        }
        if (!snapshot.hasData) {
          return Center(
            child: Text(
              '직원 정보가 없습니다',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          );
        }
        final _data = snapshot.data;
        return Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  ReusableStatus(color: StatusWorker.getEmployStatusColor(_data.status)),
                  SizedBox(width: 25),
                  Text(
                    StatusWorker.getEmployStatus(_data.status),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ),
            ContactCard(
              name: _data.name.toString() ?? "오류",
              carId: _data.carId ?? "오류",
              phone: _data.phone.toString() ?? "오류",
              role: _data.role.toString() ?? "오류",
            ),
          ],
        );
      },
    );
  }
}
