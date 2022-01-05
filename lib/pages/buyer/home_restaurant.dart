import 'package:flutter/material.dart';
import 'package:tour_app/pages/buyer/shopping_restaurant.dart';
import 'package:tour_app/pages/buyer/tracking_restaurant.dart';
import 'package:tour_app/utils/my_constant.dart';

class HomeRestaurant extends StatefulWidget {
  HomeRestaurant({Key? key}) : super(key: key);

  @override
  _HomeRestaurantState createState() => _HomeRestaurantState();
}

class _HomeRestaurantState extends State<HomeRestaurant> {
  int _selected = 0;
  List<Widget> _widget_bottom_list = [
    ShoppingRestaurant(),
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
            icon: Icon(Icons.delivery_dining),
            label: 'ติดตามการสั่งซื้อ',
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
