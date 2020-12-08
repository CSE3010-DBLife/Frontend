import 'package:flutter/material.dart';
import 'package:hotel_management/utilities/constants.dart';

class ReusableButton extends StatelessWidget {
  ReusableButton({@required this.title, this.onTap, this.isMax, this.padding, this.activeColor});
  final bool isMax;
  final String title;
  final Function onTap;
  final EdgeInsets padding;
  final Color activeColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8.0),
      onTap: onTap,
      child: Container(
        decoration: cardDecoration.copyWith(color: activeColor ?? Colors.blue.withOpacity(.5)),
        child: Padding(
          padding: padding,
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ),
    );
  }
}
