import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/futurebuilders/employ_detail/employ_detail_card_builder.dart';

class EmployDetailScreen extends StatefulWidget {
  EmployDetailScreen({this.employId});
  final String employId;
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
              CustomTitle(title: '직원 ${widget.employId} 상세정보'),
              EmployDetailCardBuilder(widget.employId),
            ],
          ),
        ),
      ),
    );
  }
}
