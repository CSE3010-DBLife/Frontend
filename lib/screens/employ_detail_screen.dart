import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_back.dart';
import 'package:hotel_management/futurebuilders/employ_detail/employ_detail_card_builder.dart';

class EmployDetailScreen extends StatefulWidget {
  EmployDetailScreen({this.employId, this.name});
  final String employId;
  final String name;
  @override
  _EmployDetailScreenState createState() => _EmployDetailScreenState();
}

class _EmployDetailScreenState extends State<EmployDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ReusableBack(),
              CustomTitle(title: '직원 ${widget.name}의 상세정보'),
              EmployDetailCardBuilder(widget.employId),
            ],
          ),
        ),
      ),
    );
  }
}
