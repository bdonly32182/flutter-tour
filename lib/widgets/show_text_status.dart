import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';

class ShowTextStatus extends StatelessWidget {
  final String status;
  const ShowTextStatus({Key? key, required this.status}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      MyConstant().statusColor[status]!['text'],
      style: TextStyle(
        color: MyConstant().statusColor[status]!['color'],
        fontSize: 16,
      ),
    );
  }
}
