import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_status.dart';
import 'package:hotel_management/models/employ.dart';
import 'package:hotel_management/screens/employ_detail_screen.dart';
import 'package:hotel_management/services/employQuery.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:hotel_management/utilities/statusWorker.dart';

EmployQuery _employQuery = EmployQuery();

class EmployCardBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Employ>>(
        future: _employQuery.getEmployData(),
        builder: (context, AsyncSnapshot<List<Employ>> snapshot) {
          if (snapshot.data == null || snapshot.data.isEmpty) {
            return Center(
              child: Text(
                '직원 정보가 없습니다.',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  EmployCard(
                    id: snapshot.data[index].id ?? "오류",
                    status: snapshot.data[index].status ?? "오류",
                    name: snapshot.data[index].name ?? "오류",
                  ),
                  SizedBox(height: 16),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class EmployCard extends StatelessWidget {
  const EmployCard({
    this.id,
    this.name,
    this.status,
    this.phone,
  });
  final String id;
  final String name;
  final String status;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EmployDetailScreen(employId: id);
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
                    '${name}',
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
