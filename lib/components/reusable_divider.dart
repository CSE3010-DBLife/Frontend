import 'package:flutter/material.dart';

class ReusableDivider extends StatelessWidget {
  ReusableDivider({@required this.isVertical});
  final bool isVertical;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: isVertical == true
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: VerticalDivider(
                thickness: 0.5,
                width: 20,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                thickness: 0.5,
                height: 20,
              ),
            ),
    );
  }
}
