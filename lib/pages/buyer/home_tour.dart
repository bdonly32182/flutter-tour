import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer/shopping_tour.dart';
import 'package:tour_app/pages/buyer/tracking_restaurant.dart';

import '../package_tour.dart';

class HomeTour extends StatefulWidget {
  HomeTour({Key? key}) : super(key: key);

  @override
  _HomeTourState createState() => _HomeTourState();
}

class _HomeTourState extends State<HomeTour> {
  int _selected = 0;
  List<Widget> _widget_bottom_list = [
    PackageTour(isAdmin: false),
    TrackingRestaurant(),
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
        selectedItemColor: Colors.tealAccent[700],
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
