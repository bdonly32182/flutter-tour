import 'package:flutter/material.dart';
import 'package:tour_app/pages/seller/dashboard_restaurant.dart';
import 'package:tour_app/pages/notification.dart';
import 'package:tour_app/pages/profile.dart';
import 'package:tour_app/pages/seller/seller_product.dart';

class SellerService extends StatefulWidget {
  SellerService({Key? key}) : super(key: key);

  @override
  _SellerServiceState createState() => _SellerServiceState();
}

class _SellerServiceState extends State<SellerService> {
  int _selected = 0;
  List<Widget> _widget_bottom_list = [
    ProductSeller(),
    DashboardRestaurant(),
    Notifications(),
    Profile(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SafeArea(
          child: _widget_bottom_list[_selected],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'MyStore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_graph),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: _onItemTapped,
          currentIndex: _selected,
          selectedItemColor: Colors.tealAccent[700],
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}
