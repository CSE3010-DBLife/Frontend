import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({this.title, this.searchIcon, this.searchIconOnPressed});
  final String title;
  final Icon searchIcon;
  final Function searchIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline6),
        searchIcon != null ? IconButton(icon: searchIcon, onPressed: searchIconOnPressed) : SizedBox()
      ],
    );
  }
}
