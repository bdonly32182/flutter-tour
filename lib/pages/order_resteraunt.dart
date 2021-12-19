import 'package:flutter/material.dart';
import 'package:tour_app/pages/check_order_resteraunt.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';
import 'package:tour_app/widgets/show_text_status.dart';

class OrderResteraunt extends StatefulWidget {
  OrderResteraunt({Key? key}) : super(key: key);

  @override
  _OrderResterauntState createState() => _OrderResterauntState();
}

class _OrderResterauntState extends State<OrderResteraunt> {
  List<Map<String, dynamic>> orders = [
    {
      'orderId': '1',
      'userIdentify': 'jakkaphan piaphengton',
      'price': 1500,
      'statusApprove': 'Pending',
      'amountMenu': 3
    },
    {
      'orderId': '2',
      'userIdentify': 'narubest piaphengton',
      'price': 2500,
      'statusApprove': 'WaitAccepted',
      'amountMenu': 2
    },
    {
      'orderId': '3',
      'userIdentify': 'anongnuch piaphengton',
      'price': 1800,
      'statusApprove': 'Rejected',
      'amountMenu': 1
    },
    {
      'orderId': '4',
      'userIdentify': 'thitirat piaphengton',
      'price': 2000,
      'statusApprove': 'Joined',
      'amountMenu': 4
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
                      builder: (context) => CheckOrderResteraunt(
                          orderId: orders[index]['orderId']),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  width: width * .92,
                  height: height * .2,
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
          // Row(
          //   children: [
          //     Container(
          //       child: const Icon(
          //         Icons.location_on_sharp,
          //         color: Colors.black54,
          //       ),
          //       margin: const EdgeInsets.all(7),
          //     ),
          //     Text(
          //       orders[index]['packageName'],
          //       style: const TextStyle(
          //         color: Color.fromRGBO(41, 187, 137, 1),
          //         fontSize: 16,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ],
          // ),
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
                  Icons.food_bank_rounded,
                  color: Colors.black54,
                ),
                margin: const EdgeInsets.all(7),
              ),
              Text(
                orders[index]['amountMenu'].toString(),
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
      height: 130,
      child: ShowImage(pathImage: MyConstant.delivery),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)
          // shape: BoxShape.circle,
          // color: Colors.yellow[700],
          ),
    );
  }
}
