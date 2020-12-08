import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:hotel_management/components/reusable_button.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_textfield.dart';
import 'package:hotel_management/futurebuilders/booking/query_result_builder.dart';
import 'package:hotel_management/models/address.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:hotel_management/utilities/dialogWorker.dart';

class BookingCardNewbuilder extends StatefulWidget {
  @override
  _BookingCardNewbuilderState createState() => _BookingCardNewbuilderState();
}

DateTime checkInDate = DateTime.now();
DateTime checkOutDate = DateTime(2090);

class _BookingCardNewbuilderState extends State<BookingCardNewbuilder> {
  String roadAddress = "";
  String zipCode = "";
  TextEditingController roomIdTextEditingController = TextEditingController();
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();
  TextEditingController phoneCodeTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController countryTextEditingController = TextEditingController();
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
              SizedBox(width: 16),
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
          ReusableCard(
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
                        "고객 주소",
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ),
                    Spacer(),
                    ReusableButton(
                      onTap: () async {
                        final Address _address = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QueryResultBuilder(),
                          ),
                        );
                        roadAddress = _address.roadAddress;
                        zipCode = _address.zipCode;
                        setState(() {});
                      },
                      title: "선택하기",
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 16.0),
                      child: Text((roadAddress.isEmpty || zipCode.isEmpty) ? "선택필요" : roadAddress + " ( " + zipCode + " ) "),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ReusableTextField(
                title: "고객 상세주소",
                textEditingController: addressTextEditingController,
                minWidth: 100,
                textInputType: TextInputType.streetAddress,
                hintText: '고객 상세주소 입력',
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              ReusableTextField(
                title: "국가번호",
                textEditingController: phoneCodeTextEditingController,
                maxLength: 5,
                minWidth: 100,
                textInputType: TextInputType.phone,
                hintText: '국가번호 입력',
              ),
              SizedBox(width: 16),
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
                title: "지역",
                textEditingController: countryTextEditingController,
                minWidth: 100,
                maxLength: 10,
                textInputType: TextInputType.text,
                hintText: '지역 입력',
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
            onTap: () {
              if (roomIdTextEditingController.value.text.isEmpty || nameTextEditingController.value.text.isEmpty || adultTextEditingController.value.text.isEmpty || childrenTextEditingController.value.text.isEmpty || phoneTextEditingController.value.text.isEmpty || addressTextEditingController.value.text.isEmpty || zipCode.isEmpty || (payTypes[0] == false && payTypes[1] == false)) {
                DialogWorker.showDialog(
                  context: context,
                  title: '입력안됨',
                  body: '빈칸을 모두 입력 해주세요',
                  positiveActionText: '확인',
                  positiveAction: () {
                    Navigator.pop(context);
                  },
                );
              } else {
                String _output = "";
                _output += "방 호수 : " + roomIdTextEditingController.value.text + "\n\n";
                _output += "고객 이름 : " + nameTextEditingController.value.text + "\n\n";
                _output += "성인 : " + adultTextEditingController.value.text + "\n\n";
                _output += "미성년자 : " + childrenTextEditingController.value.text + "\n\n";
                _output += "전화번호 : " + phoneTextEditingController.value.text + "\n\n";
                _output += "주소 : " + roadAddress + addressTextEditingController.value.text + "\n\n";
                _output += "우편번호 : " + zipCode + "\n\n";
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
                    NetWorkHelper netWorkHelper = NetWorkHelper(url: Api.url + "/add/new");
                    print(Api.url + "/add/new");
                    final body = jsonEncode({
                      "room_id": roomIdTextEditingController.value.text,
                      "adults": adultTextEditingController.value.text,
                      "children": childrenTextEditingController.value.text,
                      "check_in": checkInDate.year.toString() + "-" + checkInDate.month.toString() + "-" + checkInDate.day.toString(),
                      "check_out": checkOutDate.year.toString() + "-" + checkOutDate.month.toString() + "-" + checkOutDate.day.toString(),
                      "cus_name": nameTextEditingController.value.text,
                      "country": countryTextEditingController.value.text,
                      "phone_code": phoneCodeTextEditingController.value.text,
                      "phone_num": phoneTextEditingController.value.text,
                      "roadAddr": roadAddress,
                      "detailAddr": addressTextEditingController.value.text,
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
            title: "예약하기",
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
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
