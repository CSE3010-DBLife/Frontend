import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/utilities/constants.dart';

class ReusableDialogTextField extends StatelessWidget {
  ReusableDialogTextField({this.textEditingController, this.title, this.hintText, this.onChanged, this.maxLength, this.textInputType, this.obscureText});
  final TextEditingController textEditingController;
  final String hintText;
  final String title;
  final Function onChanged;
  final int maxLength;
  final TextInputType textInputType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: cardInnerDecoration.copyWith(color: Colors.black.withOpacity(.5)),
              margin: EdgeInsets.only(left: 8.0),
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 16.0),
                child: TextField(
                  controller: textEditingController,
                  autofocus: true,
                  cursorColor: Color(0xFFE7E7E7),
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: Theme.of(context).textTheme.subtitle2.color.withOpacity(.5),
                        ),
                    counterText: "",
                  ),
                  style: Theme.of(context).textTheme.subtitle2,
                  keyboardType: textInputType,
                  obscureText: obscureText ?? false,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
