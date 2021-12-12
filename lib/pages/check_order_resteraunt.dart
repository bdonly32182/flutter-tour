import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';
import 'package:tour_app/widgets/show_text_status.dart';

class CheckOrderResteraunt extends StatefulWidget {
  final String orderId;
  CheckOrderResteraunt({Key? key, required this.orderId}) : super(key: key);

  @override
  _CheckOrderResterauntState createState() => _CheckOrderResterauntState();
}

class _CheckOrderResterauntState extends State<CheckOrderResteraunt> {
  Map<String, dynamic> order = {
    'userIdentify': 'jakkaphan piaphengton',
    'address':
        '19/19 บางกระดี่ ซ. 32 ตำบล แสมดำ อำเภอ บางขุนเทียน จังหวัด กทม รหัสไปรษณีย์ 10150',
    'price': 1500,
    'statusApprove': 'Pending',
    'phone': '081-420-6492',
    'imageApprove': MyConstant.waiting,
    'startDate': '12/12/2021',
    'endDate': '14/12/2021',
    'option': [
      'เสริมเตียงคู่เสริมเตียงคู่เสริมเตียงคู่เสริมเตียงคู่เสริมเตียงคู่เสริมเตียงคู่เสริมเตียงคู่',
      'เสริมเตียงคู่',
      'เสริมเตียงคู่',
      'เสริมเตียงคู่'
    ],
    'amountRoom': 2,
  };
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
          const SizedBox(height: 15),
          buildIdentify(),
          buildPhone(),
          buildememberAmount(),
          buildPrice(),
          buildStartDate(),
          buildEndDate(),
          buildOption(width),
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
            order['phone'],
            style: const TextStyle(
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

  Container buildememberAmount() {
    return Container(
      height: 35,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'จำนวนห้อง : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '${order['amountRoom'].toString()} คน',
            style: const TextStyle(
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
      margin: const EdgeInsets.all(5),
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
            style: const TextStyle(
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

  Container buildStartDate() {
    return Container(
      height: 35,
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'วันที่เช็กอิน : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              order['startDate'].toString(),
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
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

  Container buildEndDate() {
    return Container(
      height: 35,
      margin: const EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'วันที่เช็กเอาท์ : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            child: Text(
              order['endDate'].toString(),
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
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

  Container buildOption(double width) {
    return Container(
      height: 140,
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            'เพิ่มเติม : ',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
              height: 90,
              width: width * .5,
              child: ListView.builder(
                  itemCount: order['option']!.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        Text(
                          '${index + 1} : ${order['option'][index]}',
                          maxLines: 3,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          thickness: 3,
                        ),
                      ],
                    );
                  }))
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
