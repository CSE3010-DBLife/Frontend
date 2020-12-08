import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hotel_management/components/custom_title.dart';
import 'package:hotel_management/components/reusable_back.dart';
import 'package:hotel_management/components/reusable_loading.dart';
import 'package:hotel_management/components/reusable_textfield.dart';
import 'package:hotel_management/models/address.dart';
import 'package:hotel_management/services/addressQuery.dart';
import 'package:hotel_management/utilities/constants.dart';

class QueryResultBuilder extends StatefulWidget {
  @override
  _QueryResultBuilderState createState() => _QueryResultBuilderState();
}

AddressQuery _addressQuery = AddressQuery();

class _QueryResultBuilderState extends State<QueryResultBuilder> {
  TextEditingController addressTextEditingController = TextEditingController();
  String zipCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            ReusableBack(),
            CustomTitle(
              title: "조회결과",
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ReusableTextField(
                  title: '주소검색',
                  hintText: '주소 입력',
                  textEditingController: addressTextEditingController,
                  minWidth: 200,
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
            // SizedBox(height: 16),
            Expanded(
              child: FutureBuilder<List<Address>>(
                future: _addressQuery.getAddressData(addressTextEditingController.value.text),
                builder: (context, AsyncSnapshot<List<Address>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ReusableLoading();
                  }
                  if (snapshot.data == null) {
                    return Center(
                      child: Text(
                        '일치하는 주소가 없습니다',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    );
                  }

                  final _data = snapshot.data;
                  return ListView.builder(
                    itemCount: _data.length,
                    itemBuilder: (context, index) {
                      return AddressDataBox(
                        roadAddress: _data[index].roadAddress,
                        zipCode: _data[index].zipCode,
                        onTap: () {
                          addressTextEditingController.value = TextEditingValue(
                            text: _data[index].roadAddress.toString(),
                            selection: TextSelection.fromPosition(
                              TextPosition(offset: (_data[index].roadAddress.toString()).length),
                            ),
                          );
                          zipCode = _data[index].zipCode.toString();
                          setState(() {});
                        },
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                Navigator.pop(context, Address(roadAddress: addressTextEditingController.value.text, zipCode: zipCode));
              },
              child: Container(
                width: double.maxFinite,
                decoration: cardDecoration.copyWith(color: Colors.blue.withOpacity(.5)),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Center(
                    child: Text(
                      '선택하기',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddressDataBox extends StatelessWidget {
  AddressDataBox({this.roadAddress, this.zipCode, this.onTap});
  final String roadAddress;
  final String zipCode;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      decoration: cardDecoration.copyWith(color: Colors.blue.withOpacity(.5)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Row(
            children: [
              Text(roadAddress),
              SizedBox(width: 4),
              Text(' ( $zipCode ) '),
            ],
          ),
        ),
      ),
    );
  }
}
