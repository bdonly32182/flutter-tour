import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';

class ShoppingRestaurant extends StatefulWidget {
  ShoppingRestaurant({Key? key}) : super(key: key);

  @override
  _ShoppingRestaurantState createState() => _ShoppingRestaurantState();
}

class _ShoppingRestaurantState extends State<ShoppingRestaurant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      body: ListView(
        children: [
          Row(
            children: [Text('Search')],
          )
        ],
      ),
    );
  }
}
