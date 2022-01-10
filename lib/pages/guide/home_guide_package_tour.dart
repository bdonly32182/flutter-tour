import 'package:flutter/material.dart';
import 'package:tour_app/pages/guide/detail_package_tour.dart';
import 'package:tour_app/pages/guide/list_tourism.dart';
import 'package:tour_app/utils/my_constant.dart';

class HomeGuidePackageTour extends StatefulWidget {
  HomeGuidePackageTour({Key? key}) : super(key: key);

  @override
  _HomeGuidePackageTourState createState() => _HomeGuidePackageTourState();
}

class _HomeGuidePackageTourState extends State<HomeGuidePackageTour> {
  int _selected = 0;
  List<Widget> _widget_bottom_list = [
    DetailPackageTour(),
    ListTourism(),
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
            label: 'Package Tour',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Tourism',
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
