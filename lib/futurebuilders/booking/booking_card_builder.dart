import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management/futurebuilders/booking/booking_card_new_builder.dart';
import 'package:hotel_management/futurebuilders/booking/booking_card_old_builder.dart';

class BookingCardBuilder extends StatefulWidget {
  @override
  _BookingCardBuilderState createState() => _BookingCardBuilderState();
}

class _BookingCardBuilderState extends State<BookingCardBuilder> {
  ScrollController _scrollViewController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (context, bool) => [],
        body: Column(
          children: [
            ButtonsTabBar(
              backgroundColor: Colors.blue.withOpacity(.5),
              tabs: [
                Tab(text: "신규"),
                Tab(text: "기존"),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  BookingCardNewbuilder(),
                  BookingCardOldBuilder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
