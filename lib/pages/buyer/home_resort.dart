import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer/filter_room.dart';
import 'package:tour_app/pages/buyer/tracking_booking_resort.dart';
import 'package:tour_app/utils/my_constant.dart';

class HomeResort extends StatefulWidget {
  HomeResort({Key? key}) : super(key: key);

  @override
  _HomeResortState createState() => _HomeResortState();
}

class _HomeResortState extends State<HomeResort> {
  int _selected = 0;
  List<Widget> _widget_bottom_list = [
    FilterRoom(),
    TrackingBookingResort(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widget_bottom_list[_selected],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined),
            label: 'ติดตามการจอง',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selected,
        selectedItemColor: MyConstant.themeApp,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
