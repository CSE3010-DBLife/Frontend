import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_dialog_textfield.dart';
import 'package:hotel_management/futurebuilders/employ/employ_card_builder.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';
import 'package:hotel_management/utilities/dialogWorker.dart';

class EmployScreen extends StatefulWidget {
  @override
  _EmployScreenState createState() => _EmployScreenState();
}

class _EmployScreenState extends State<EmployScreen> {
  TextEditingController _nameInput = TextEditingController();
  TextEditingController _pwInput = TextEditingController();
  TextEditingController _salaryInput = TextEditingController();
  TextEditingController _roleInput = TextEditingController();
  TextEditingController _phonCodeInput = TextEditingController();
  TextEditingController _phoneNumInput = TextEditingController();
  TextEditingController _roadAddrInput = TextEditingController();
  TextEditingController _detailAddrInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CustomTitle(
              title: '직원',
              // searchIcon: Icon(Icons.search),
              // searchIconOnPressed: () {},
            ),
            EmployCardBuilder(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          DialogWorker.showInformationDialog(
            context: context,
            title: '직원 추가',
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ReusableDialogTextField(
                        textEditingController: _nameInput,
                        title: '이름',
                        hintText: '이름 입력',
                      ),
                    ),
                    Expanded(
                      child: ReusableDialogTextField(
                        textEditingController: _pwInput,
                        title: '비밀번호',
                        hintText: '비밀번호 입력',
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableDialogTextField(
                        textEditingController: _roleInput,
                        title: '담당',
                        hintText: '담당 입력',
                      ),
                    ),
                    Expanded(
                      child: ReusableDialogTextField(
                        textEditingController: _salaryInput,
                        title: '연봉',
                        hintText: '연봉 입력',
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableDialogTextField(
                        textEditingController: _phonCodeInput,
                        title: '국가번호',
                        hintText: '국가번호 입력',
                      ),
                    ),
                    Expanded(
                      child: ReusableDialogTextField(
                        textEditingController: _phoneNumInput,
                        title: '전화번호',
                        hintText: '전화번호 입력',
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ReusableDialogTextField(
                        textEditingController: _roadAddrInput,
                        title: '도로명 주소',
                        hintText: '도로명 주소 입력',
                      ),
                    ),
                    Expanded(
                      child: ReusableDialogTextField(
                        textEditingController: _detailAddrInput,
                        title: '상세 주소',
                        hintText: '상세 주소 입력',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            positiveActionText: '등록',
            negativeActionText: '취소',
            positiveAction: () {
              String _output = "";
              _output += "이름 : " + _nameInput.value.text + "\n\n";
              _output += "비밀번호 : " + _pwInput.value.text + "\n\n";
              _output += "담당 : " + _roleInput.value.text + "\n\n";
              _output += "연봉 : " + _salaryInput.value.text + "\n\n";
              _output += "국가번호 : " + _phonCodeInput.value.text + "\n\n";
              _output += "전화번호 : " + _phoneNumInput.value.text + "\n\n";
              _output += "도로명 주소 : " + _roadAddrInput.value.text + "\n\n";
              _output += "상세 주소 : " + _detailAddrInput.value.text;
              DialogWorker.showDialog(
                context: context,
                title: '등록 하시겠습니까?',
                body: _output,
                positiveActionText: '예',
                negativeActionText: '아니요',
                positiveAction: () async {
                  Navigator.pop(context);

                  DialogWorker.showLoadingDialog(context);
                  NetWorkHelper netWorkHelper = NetWorkHelper(url: Api.url + "/add/employ");
                  print(Api.url + "/add/employ");
                  final body = jsonEncode({
                    "employ_name": _nameInput.value.text,
                    "employ_pw": _pwInput.value.text,
                    "role": _roleInput.value.text,
                    "salary": _salaryInput.value.text,
                    "phone_code": _phonCodeInput.value.text,
                    "phone_num": _phoneNumInput.value.text,
                    "roadAddr": _roadAddrInput.value.text,
                    "detailAddr": _detailAddrInput.value.text,
                  });
                  final result = await netWorkHelper.postData(
                    body: body,
                  );
                  Navigator.pop(context);
                  if (result['result'] == 200) {
                    DialogWorker.showDialog(
                      context: context,
                      title: '등록 완료',
                      body: '등록 되었습니다',
                      positiveActionText: '확인',
                      positiveAction: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                    );
                  } else {
                    DialogWorker.showDialog(
                      context: context,
                      title: '등록 실패',
                      body: '등록에 실패하였습니다\n등록 정보를 확인해주세요',
                      positiveActionText: '확인',
                      positiveAction: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                    );
                  }
                },
                negativeAction: () {
                  Navigator.pop(context);
                },
              );
            },
            negativeAction: () => Navigator.pop(context),
          );
        },
      ),
    );
  }
}
