import 'package:flutter/material.dart';

class ReusableStatus extends StatelessWidget {
  ReusableStatus({@required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: 15,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
