import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';
import 'package:tour_app/widgets/show_text_status.dart';

class CheckOrderPackageTour extends StatefulWidget {
  final String orderId;
  const CheckOrderPackageTour({Key? key, required this.orderId})
      : super(key: key);

  @override
  _CheckOrderPackageTourState createState() => _CheckOrderPackageTourState();
}

class _CheckOrderPackageTourState extends State<CheckOrderPackageTour> {
  Map<String, dynamic> order = {
    'userIdentify': 'jakkaphan piaphengton',
    'packageName': 'หัวหิน',
    'price': 1500,
    'statusApprove': 'Pending',
    'memberAmount': 3,
    'phone': '081-420-6492',
    'imageApprove': MyConstant.waiting,
  };
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดรายการสั่งซื้อ'),
        backgroundColor: Colors.tealAccent[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildOrderId(),
            buildImageWaiting(width, height),
            cardDetail(width),
            buildSlipword(),
            buildSlipImage(width, height),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Container buildSlipword() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'ใบเสร็จรับเงิน',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.tealAccent[700],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container cardDetail(double width) {
    return Container(
      width: width * .8,
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          buildIdentify(),
          buildPhone(),
          buildPackageName(),
          buildeMemberAmount(),
          buildPrice(),
          confirmButton(),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Row buildImageWaiting(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(12),
          width: width * .7,
          height: height * .3,
          child: ShowImage(pathImage: order['imageApprove']),
        )
      ],
    );
  }

  ElevatedButton confirmButton() {
    return ElevatedButton(
      child: const Text(
        'ยืนยันออร์เดอร์นี้',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {
        print('ยืนยันออร์เดอร์นี้');
      },
    );
  }

  Container buildPhone() {
    return Container(
      height: 35,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'เบอร์โทรติดต่อ : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            order['phone'].toString(),
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container buildeMemberAmount() {
    return Container(
      height: 35,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'จำนวน : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${order['memberAmount'].toString()} คน',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container buildPrice() {
    return Container(
      height: 35,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'ราคา : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${order['price'].toString()} บาท',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container buildPackageName() {
    return Container(
      height: 35,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'ชื่อแพ็คเกจ : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            order['packageName'],
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container buildIdentify() {
    return Container(
      height: 35,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'ชื่อผู้สั่งซื้อ : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            order['userIdentify'],
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Container buildOrderId() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: ShowTextStatus(status: order['statusApprove']),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Row buildSlipImage(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(10),
          width: width * .7,
          height: height * .3,
          child: ShowImage(pathImage: order['imageApprove']),
        )
      ],
    );
  }
}
