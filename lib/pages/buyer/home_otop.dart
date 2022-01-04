import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer/shopping_otop.dart';
import 'package:tour_app/pages/buyer/tracking_otop.dart';


class HomeOtop extends StatefulWidget {
  HomeOtop({Key? key}) : super(key: key);

  @override
  _HomeOtopState createState() => _HomeOtopState();
}

class _HomeOtopState extends State<HomeOtop> {
  int _selected = 0;
  List<Widget> _widget_bottom_list = [
    ShoppingOtop(),
    TrackingOtop(),
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
            icon: Icon(Icons.delivery_dining),
            label: 'ติดตามการสั่งซื้อ',
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selected,
        selectedItemColor: Colors.tealAccent[700],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
