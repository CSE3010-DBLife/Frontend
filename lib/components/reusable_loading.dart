import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReusableLoading extends StatelessWidget {
  ReusableLoading({this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      size: 50,
      color: color ?? Colors.grey,
    );
  }
}
