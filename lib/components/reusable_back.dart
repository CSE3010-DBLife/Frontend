import 'dart:html';

import 'package:flutter/material.dart';

class ReusableBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.zero,
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 20),
        ),
        Spacer()
      ],
    );
  }
}
