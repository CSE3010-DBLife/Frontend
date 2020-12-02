import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/futurebuilders/employ/employ_card_builder.dart';

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
          EmployCardBuilder()
        ],
      ),
    );
  }
}
