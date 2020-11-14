import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  CustomTitle({this.title, this.searchIcon, this.searchIconOnPressed});
  final String title;
  final Icon searchIcon;
  final Function searchIconOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.headline6),
          searchIcon != null
              ? IconButton(padding: EdgeInsets.zero, icon: searchIcon, onPressed: searchIconOnPressed)
              : IconButton(
                  // remove icon, due to padding
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.0),
                  ),
                )
        ],
      ),
    );
  }
}
