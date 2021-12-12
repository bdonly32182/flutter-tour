import 'package:flutter/material.dart';
import 'package:tour_app/pages/adminpage/home_admin.dart';
import 'package:tour_app/pages/adminpage/order_package_tour.dart';
import 'package:tour_app/pages/notification.dart';
import 'package:tour_app/pages/profile.dart';

class AdminService extends StatefulWidget {
  AdminService({Key? key}) : super(key: key);

  @override
  _AdminServiceState createState() => _AdminServiceState();
}

class _AdminServiceState extends State<AdminService> {
  int _selected = 0;
  List<Widget> _widget_bottom_list = [
    HomeAdmin(),
    OrderPackageTour(),
    Notifications(),
    Profile()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: _widget_bottom_list[_selected],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Order',
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
    );
  }
}
