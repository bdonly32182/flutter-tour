import 'package:flutter/material.dart';
class GuideService extends StatefulWidget {
  GuideService({Key? key}) : super(key: key);

  @override
  _GuideServiceState createState() => _GuideServiceState();
}

class _GuideServiceState extends State<GuideService> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Guide Page'),
    );
  }
}