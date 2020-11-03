import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.decoration, this.cardChild});

  final Widget cardChild;
  final BoxDecoration decoration;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      padding: EdgeInsets.all(8.0),
      decoration: decoration,
    );
  }
}
