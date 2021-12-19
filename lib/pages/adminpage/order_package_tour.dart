import 'package:flutter/material.dart';
import 'package:tour_app/pages/adminpage/check_order_package.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';
import 'package:tour_app/widgets/show_text_status.dart';

class OrderPackageTour extends StatefulWidget {
  OrderPackageTour({Key? key}) : super(key: key);

  @override
  _OrderPackageTourState createState() => _OrderPackageTourState();
}

class _OrderPackageTourState extends State<OrderPackageTour> {
  List<Map<String, dynamic>> orders = [
    {
      'orderId': '1',
      'userIdentify': 'jakkaphan piaphengton',
      'packageName': 'หัวหิน',
      'price': 1500,
      'statusApprove': 'Pending',
      'memberAmount': 3
    },
    {
      'orderId': '2',
      'userIdentify': 'narubest piaphengton',
      'packageName': 'เชียงใหม่',
      'price': 2500,
      'statusApprove': 'WaitAccepted',
      'memberAmount': 2
    },
    {
      'orderId': '3',
      'userIdentify': 'anongnuch piaphengton',
      'packageName': 'ภูเก็ต',
      'price': 1800,
      'statusApprove': 'Rejected',
      'memberAmount': 1
    },
    {
      'orderId': '4',
      'userIdentify': 'thitirat piaphengton',
      'packageName': 'กรุงเทพมหานคร',
      'price': 2000,
      'statusApprove': 'Joined',
      'memberAmount': 4
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('รายการสั่งซื้อแพ็คเกจทัวร์'),
        backgroundColor: MyConstant.themeApp,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (BuildContext context, int index) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckOrderPackageTour(
                          orderId: orders[index]['orderId']),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: width * .92,
                  height: height * .25,
                  child: Row(
                    children: [
                      buildDetail(width, index),
                      buildImagePackageTour(width),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 20,
                          offset: const Offset(0, 8))
                    ],
                    color: Colors.white,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Container buildDetail(double width, int index) {
    return Container(
      width: width * .64,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                child: const Icon(
                  Icons.list_sharp,
                  color: Colors.black54,
                ),
                margin: const EdgeInsets.only(left: 10, right: 5),
              ),
              Text(
                orders[index]['userIdentify'],
                style: const TextStyle(
                  color: Color.fromRGBO(41, 187, 137, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: const Icon(
                  Icons.location_on_sharp,
                  color: Colors.black54,
                ),
                margin: const EdgeInsets.all(7),
              ),
              Text(
                orders[index]['packageName'],
                style: const TextStyle(
                  color: Color.fromRGBO(41, 187, 137, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: const Icon(
                  Icons.price_change_sharp,
                  color: Colors.black54,
                ),
                margin: const EdgeInsets.all(7),
              ),
              Text(
                orders[index]['price'].toString(),
                style: const TextStyle(
                  color: Color.fromRGBO(41, 187, 137, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                child: const Icon(
                  Icons.groups_sharp,
                  color: Colors.black54,
                ),
                margin: const EdgeInsets.all(7),
              ),
              Text(
                orders[index]['memberAmount'].toString(),
                style: const TextStyle(
                  color: Color.fromRGBO(41, 187, 137, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShowTextStatus(status: orders[index]['statusApprove']),
            ],
          ),
        ],
      ),
    );
  }

  Container buildImagePackageTour(double width) {
    return Container(
      width: width * .26,
      height: 160,
      child: ShowImage(pathImage: MyConstant.locationImage),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
          // shape: BoxShape.circle,
          // color: Colors.yellow[700],
          ),
    );
  }
}
