import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hotel_management/components/reusable_card.dart';
import 'package:hotel_management/components/reusable_loading.dart';
import 'package:hotel_management/futurebuilders/employ/employ_card.dart';
import 'package:hotel_management/models/employ.dart';
import 'package:hotel_management/services/employQuery.dart';
import 'package:hotel_management/services/networking.dart';
import 'package:hotel_management/utilities/api.dart';
import 'package:hotel_management/utilities/constants.dart';
import 'package:hotel_management/utilities/dialogWorker.dart';

EmployQuery _employQuery = EmployQuery();

class EmployCardBuilder extends StatefulWidget {
  EmployCardBuilder({this.scrollController});
  final ScrollController scrollController;
  @override
  _EmployCardBuilderState createState() => _EmployCardBuilderState();
}

class _EmployCardBuilderState extends State<EmployCardBuilder> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<List<Employ>>(
        future: _employQuery.getEmployData(),
        builder: (context, AsyncSnapshot<List<Employ>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) return ReusableLoading();
          if (snapshot.data.isEmpty) {
            return Center(
              child: Text(
                '직원 정보가 없습니다',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            );
          }

          return ListView.builder(
            controller: widget.scrollController,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Column(
                  children: [
                    EmployCard(
                      id: snapshot.data[index].id ?? "오류",
                      status: snapshot.data[index].status ?? "오류",
                      name: snapshot.data[index].name ?? "오류",
                    ),
                    SizedBox(height: 16),
                  ],
                ),
                actions: <Widget>[
                  SideActionButton(
                    onTap: () async {
                      await _doChangeStatus(context, snapshot.data[index].id, 1);
                    },
                    color: statusGreen.withAlpha(200),
                    title: '출근',
                    isLeftCorner: true,
                  ),
                  SideActionButton(
                    onTap: () async {
                      await _doChangeStatus(context, snapshot.data[index].id, 2);
                    },
                    color: statusRed.withAlpha(200),
                    title: '결근',
                  ),
                  SideActionButton(
                    onTap: () async {
                      await _doChangeStatus(context, snapshot.data[index].id, 0);
                    },
                    color: statusGrey.withAlpha(200),
                    title: '휴가',
                    isRightCorner: true,
                  ),
                ],
                secondaryActions: <Widget>[
                  SideActionButton(
                    onTap: () async {
                      await _doDelete(context, snapshot.data[index].id);
                    },
                    color: statusRed.withAlpha(200),
                    title: '삭제',
                    isLeftCorner: true,
                    isRightCorner: true,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _doChangeStatus(context, String id, int status) async {
    DialogWorker.showDialog(
      context: context,
      title: '경고',
      body: '정말 변경하시겠습니까?',
      positiveActionText: '확인',
      negativeActionText: '취소',
      positiveAction: () async {
        Navigator.pop(context);
        NetWorkHelper netWorkHelper = NetWorkHelper(url: Api.url + "/update/employ/status/$id");
        final _body = jsonEncode({'employ_status': status.toString()});
        final _result = await netWorkHelper.postData(body: _body);
        print(_result);
        if (_result['result'].toString() == "200") {
          DialogWorker.showDialog(
            context: context,
            title: '변경완료',
            body: '변경되었습니다',
            positiveActionText: '확인',
            positiveAction: () {
              Navigator.pop(context);
              setState(() {});
            },
          );
        } else {
          DialogWorker.showDialog(
            context: context,
            title: '변경실패',
            body: '변경에 실패하였습니다',
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
  }

  Future<void> _doDelete(context, String id) async {
    DialogWorker.showDialog(
      context: context,
      title: '경고',
      body: '정말 삭제하시겠습니까?',
      positiveActionText: '확인',
      negativeActionText: '취소',
      positiveAction: () async {
        Navigator.pop(context);
        NetWorkHelper netWorkHelper = NetWorkHelper(url: Api.url + "/delete/employ/$id");
        final _result = await netWorkHelper.postData();
        print(_result);
        if (_result['result'].toString() == "200") {
          DialogWorker.showDialog(
            context: context,
            title: '삭제완료',
            body: '삭제되었습니다',
            positiveActionText: '확인',
            positiveAction: () {
              Navigator.pop(context);
              setState(() {});
            },
          );
        } else {
          DialogWorker.showDialog(
            context: context,
            title: '삭제실패',
            body: '삭제에 실패하였습니다',
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
  }
}

class SideActionButton extends StatelessWidget {
  SideActionButton({Key key, this.title, this.onTap, this.color, this.isLeftCorner, this.isRightCorner}) : super(key: key);
  final String title;
  final Function onTap;
  final Color color;
  final bool isRightCorner;
  final bool isLeftCorner;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: _returnShap(isLeftCorner, isRightCorner),
      ),
      margin: EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: _returnShap(isLeftCorner, isRightCorner),
        onTap: onTap,
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }

  BorderRadius _returnShap(bool isLeftCorner, bool isRightCorner) {
    if (isLeftCorner == null && isRightCorner == null) {
      return BorderRadius.all(Radius.zero);
    } else if (isLeftCorner == true && isRightCorner == null) {
      return BorderRadius.only(
        topLeft: Radius.circular(8.0),
        bottomLeft: Radius.circular(8.0),
      );
    } else if (isLeftCorner == null && isRightCorner == true) {
      return BorderRadius.only(
        topRight: Radius.circular(8.0),
        bottomRight: Radius.circular(8.0),
      );
    } else if (isLeftCorner == true && isRightCorner == true) {
      return BorderRadius.all(Radius.circular(8.0));
    } else {
      return BorderRadius.all(Radius.zero);
    }
  }
}
