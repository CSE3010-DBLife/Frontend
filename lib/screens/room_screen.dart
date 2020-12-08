import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/futurebuilders/room/room_card_builder.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';

class RoomScreen extends StatefulWidget {
  @override
  _RoomScreenState createState() => _RoomScreenState();
}

List<bool> buttonActiveList = [true, false, false];
DateTime checkInDate = DateTime(2020);
DateTime checkOutDate = DateTime(2021);

class _RoomScreenState extends State<RoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTitle(
            title: '객실 상태',
            // searchIcon: Icon(Icons.search),
            // searchIconOnPressed: () {},
          ),
          _buildStatusFilter(),
          SizedBox(height: 16),
          _buildCheckInOutFilter(context),
          SizedBox(height: 16),
          RoomCardBuilder(
            buttons: buttonActiveList,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
          ),
        ],
      ),
    );
  }

  Widget _buildStatusFilter() {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              FilterButton(
                name: '모두',
                onTap: () {
                  if (buttonActiveList[0] == false) {
                    for (var i = 0; i < buttonActiveList.length; i++) buttonActiveList[i] = false;
                    buttonActiveList[0] = true;
                  }
                  setState(() {});
                },
                isActive: buttonActiveList[0],
              ),
              SizedBox(width: 16),
              FilterButton(
                name: '미사용중',
                onTap: () {
                  if (buttonActiveList[1] == false) {
                    for (var i = 0; i < buttonActiveList.length; i++) buttonActiveList[i] = false;
                    buttonActiveList[1] = true;
                  }
                  setState(() {});
                },
                isActive: buttonActiveList[1],
              ),
              SizedBox(width: 16),
              FilterButton(
                name: '사용중',
                onTap: () {
                  if (buttonActiveList[2] == false) {
                    for (var i = 0; i < buttonActiveList.length; i++) buttonActiveList[i] = false;
                    buttonActiveList[2] = true;
                  }
                  setState(() {});
                },
                isActive: buttonActiveList[2],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckInOutFilter(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ReusableCard(
            decoration: cardDecoration.copyWith(borderRadius: BorderRadius.horizontal(left: Radius.circular(8.0))),
            cardChild: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '체크인',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      SizedBox(width: 8),
                      Text(
                        checkInDate == null ? "설정안됨" : checkInDate.year.toString() + " 년 " + checkInDate.month.toString() + " 월 " + checkInDate.day.toString() + " 일 ",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '체크아웃',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      SizedBox(width: 8),
                      Text(
                        checkOutDate == null ? "설정안됨" : checkOutDate.year.toString() + " 년 " + checkOutDate.month.toString() + " 월 " + checkOutDate.day.toString() + " 일 ",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 1.5),
        GestureDetector(
          onTap: () async {
            DateTime newDateCheckIn = await showRoundedDatePicker(
              styleDatePicker: MaterialRoundedDatePickerStyle(
                textStyleDayButton: Theme.of(context).textTheme.subtitle1,
                textStyleYearButton: Theme.of(context).textTheme.subtitle1,
                paddingDatePicker: EdgeInsets.all(0),
                paddingMonthHeader: EdgeInsets.all(12),
                paddingActionBar: EdgeInsets.all(16),
                paddingDateYearHeader: EdgeInsets.all(32),
                textStyleButtonPositive: Theme.of(context).textTheme.button,
                textStyleButtonNegative: Theme.of(context).textTheme.button.copyWith(
                      color: Theme.of(context).textTheme.button.color.withOpacity(.5),
                    ),
              ),
              context: context,
              theme: darkThemeData,
              description: "체크인 설정",
            );
            DateTime newDateCheckOut = await showRoundedDatePicker(
              styleDatePicker: MaterialRoundedDatePickerStyle(
                textStyleDayButton: Theme.of(context).textTheme.subtitle1,
                textStyleYearButton: Theme.of(context).textTheme.subtitle1,
                paddingDatePicker: EdgeInsets.all(0),
                paddingMonthHeader: EdgeInsets.all(12),
                paddingActionBar: EdgeInsets.all(16),
                paddingDateYearHeader: EdgeInsets.all(32),
                textStyleButtonPositive: Theme.of(context).textTheme.button,
                textStyleButtonNegative: Theme.of(context).textTheme.button.copyWith(
                      color: Theme.of(context).textTheme.button.color.withOpacity(.5),
                    ),
              ),
              context: context,
              theme: darkThemeData,
              description: "체크아웃 설정",
            );
            if (newDateCheckIn != null || newDateCheckOut != null) {
              checkInDate = newDateCheckIn;
              checkOutDate = newDateCheckOut;
              setState(() {});
            }
          },
          child: ReusableCard(
            decoration: cardDecoration.copyWith(
              borderRadius: BorderRadius.horizontal(right: Radius.circular(8.0)),
              color: Colors.blue.withOpacity(.5),
            ),
            cardChild: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                child: Text(
                  '설정',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FilterButton extends StatelessWidget {
  FilterButton({@required this.name, this.isActive, this.onTap});
  final String name;
  final bool isActive;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Center(
            child: Text(
              name,
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
          decoration: BoxDecoration(
            color: isActive == true ? Colors.blue.withOpacity(.5) : cardDecoration.color,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
