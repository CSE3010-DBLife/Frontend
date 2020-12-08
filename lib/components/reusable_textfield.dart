import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/utilities/constants.dart';

class ReusableTextField extends StatelessWidget {
  ReusableTextField({
    @required this.title,
    this.onChanged,
    this.hintText,
    this.textEditingController,
    this.maxLength,
    this.minWidth,
    this.textInputType,
  });
  final String title;
  final Function onChanged;
  final String hintText;
  final TextEditingController textEditingController;
  final int maxLength;
  final double minWidth;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: GestureDetector(
          child: ReusableCard(
            decoration: cardDecoration,
            cardChild: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: cardInnerDecoration,
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 16.0),
                      child: AutoSizeTextField(
                        controller: textEditingController,
                        minWidth: minWidth,
                        fullwidth: false,
                        cursorColor: Color(0xFFE7E7E7),
                        style: Theme.of(context).textTheme.subtitle2,
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: Theme.of(context).textTheme.subtitle2.copyWith(
                                color: Theme.of(context).textTheme.subtitle2.color.withOpacity(.5),
                              ),
                          counterText: "",
                        ),
                        onChanged: onChanged,
                        maxLength: maxLength,
                        keyboardType: textInputType,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
