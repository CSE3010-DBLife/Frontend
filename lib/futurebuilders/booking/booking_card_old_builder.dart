import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:hotel_management/components/reuable_alertdialog.dart';
import 'package:hotel_management/components/reusable_button.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_textfield.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:hotel_management/utilities/dialogWorker.dart';

class BookingCardOldBuilder extends StatefulWidget {
  @override
  _BookingCardOldBuilderState createState() => _BookingCardOldBuilderState();
}

DateTime checkInDate = DateTime.now();
DateTime checkOutDate = DateTime(2090);

class _BookingCardOldBuilderState extends State<BookingCardOldBuilder> {
  TextEditingController roomIdTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController adultTextEditingController = TextEditingController();
  TextEditingController childrenTextEditingController = TextEditingController();
  List<bool> payTypes = [false, false];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCheckInOutFilter(context),
          SizedBox(height: 16),
          Row(
            children: [
              ReusableTextField(
                title: "방번호",
                textEditingController: roomIdTextEditingController,
                minWidth: 100,
                maxLength: 5,
                textInputType: TextInputType.number,
                hintText: '방번호 입력',
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ReusableTextField(
                title: "고객성함",
                textEditingController: nameTextEditingController,
                minWidth: 100,
                maxLength: 5,
                textInputType: TextInputType.name,
                hintText: '고객성함 입력',
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ReusableTextField(
                title: "전화번호",
                textEditingController: phoneTextEditingController,
                minWidth: 100,
                maxLength: 15,
                textInputType: TextInputType.number,
                hintText: '전화번호 입력',
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ReusableTextField(
                title: "성인",
                textEditingController: adultTextEditingController,
                minWidth: 100,
                maxLength: 2,
                textInputType: TextInputType.number,
                hintText: '인원 입력',
              ),
              SizedBox(width: 16),
              ReusableTextField(
                title: "미성년자",
                textEditingController: childrenTextEditingController,
                minWidth: 100,
                maxLength: 2,
                textInputType: TextInputType.number,
                hintText: '인원 입력',
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ReusableButton(
                  title: '무통장',
                  onTap: () {
                    payTypes[0] = true;
                    payTypes[1] = false;
                    setState(() {});
                  },
                  activeColor: payTypes[0] == true ? Colors.blue.withOpacity(.5) : Colors.grey.withOpacity(.5),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ReusableButton(
                  title: '카드',
                  onTap: () {
                    payTypes[1] = true;
                    payTypes[0] = false;
                    setState(() {});
                  },
                  activeColor: payTypes[1] == true ? Colors.blue.withOpacity(.5) : Colors.grey.withOpacity(.5),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ReusableButton(
            title: '예약하기',
            onTap: () async {
              if (roomIdTextEditingController.value.text.isEmpty || nameTextEditingController.value.text.isEmpty || adultTextEditingController.value.text.isEmpty || childrenTextEditingController.value.text.isEmpty || phoneTextEditingController.value.text.isEmpty || (payTypes[0] == false && payTypes[1] == false)) {
                showAnimatedDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return ReusableAlertDialog(
                      title: '입력안됨',
                      body: "빈칸을 모두 입력 해주세요",
                      positiveActionText: '확인',
                      positiveAction: () {
                        Navigator.pop(context);
                      },
                    );
                  },
                  animationType: DialogTransitionType.size,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 500),
                );
              } else {
                String _output = "";
                _output += "방 호수 : " + roomIdTextEditingController.value.text + "\n\n";
                _output += "고객 이름 : " + nameTextEditingController.value.text + "\n\n";
                _output += "성인 : " + adultTextEditingController.value.text + "\n\n";
                _output += "미성년자 : " + childrenTextEditingController.value.text + "\n\n";
                _output += "전화번호 : " + phoneTextEditingController.value.text + "\n\n";
                _output += "체크인 : " + checkInDate.year.toString() + "-" + checkInDate.month.toString() + "-" + checkInDate.day.toString() + "\n\n";
                _output += "체크아웃 : " + checkOutDate.year.toString() + "-" + checkOutDate.month.toString() + "-" + checkOutDate.day.toString() + "\n\n";
                _output += "결제방식 : " + (payTypes[0] ? "무통장" : "카드");
                DialogWorker.showDialog(
                  context: context,
                  title: '예약 하시겠습니까?',
                  body: _output,
                  positiveActionText: '예',
                  negativeActionText: '아니요',
                  positiveAction: () async {
                    Navigator.pop(context);
                    DialogWorker.showLoadingDialog(context);
                    NetWorkHelper netWorkHelper = NetWorkHelper(url: Api.url + "/add/current");
                    print(Api.url + "/add/current");
                    final body = jsonEncode({
                      "room_id": roomIdTextEditingController.value.text,
                      "cus_name": nameTextEditingController.value.text,
                      "phone_num": phoneTextEditingController.value.text,
                      "adults": adultTextEditingController.value.text,
                      "children": childrenTextEditingController.value.text,
                      "check_in": checkInDate.year.toString() + "-" + checkInDate.month.toString() + "-" + checkInDate.day.toString(),
                      "check_out": checkOutDate.year.toString() + "-" + checkOutDate.month.toString() + "-" + checkOutDate.day.toString(),
                      "pay_type": payTypes[0] ? 0 : 1,
                    });
                    final result = await netWorkHelper.postData(
                      body: body,
                    );
                    Navigator.pop(context);
                    if (result['result'] == 200) {
                      DialogWorker.showDialog(
                        context: context,
                        title: '예약 완료',
                        body: '예약 되었습니다',
                        positiveActionText: '확인',
                        positiveAction: () {
                          Navigator.pop(context);
                        },
                      );
                    } else {
                      DialogWorker.showDialog(
                        context: context,
                        title: '예약 실패',
                        body: '예약에 실패하였습니다\n예약 정보를 확인해주세요',
                        positiveActionText: '확인',
                        positiveAction: () {
                          Navigator.pop(context);
                        },
                      );
                    }
                  },
                  negativeAction: () {
                    Navigator.pop(context);
                  },
                );
              }
            },
            padding: EdgeInsets.symmetric(vertical: 16.0),
          ),
        ],
      ),
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
