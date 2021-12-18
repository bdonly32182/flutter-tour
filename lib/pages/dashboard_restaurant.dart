import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';

class DashboardRestaurant extends StatefulWidget {
  DashboardRestaurant({Key? key}) : super(key: key);

  @override
  _DashboardRestaurantState createState() => _DashboardRestaurantState();
}

class _DashboardRestaurantState extends State<DashboardRestaurant> {
  bool focusIncomeMonth = true;
  bool focusIncomeYear = false;
  bool focusSelectDate = false;
  DateTime filterDashboard = DateTime.now();
  String type = 'month';
  String? filterDate(DateTime date, String type) {
    if (type == 'year') {
      return 'ปี ${date.year}';
    }
    if (type == 'month') {
      String month = MyConstant().monthThailand[date.month - 1];
      return '${month}  ${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildFirstChart(width),
              buildSecondChart(width),
              buildFilterDashboard(),
              buildShowAndSelectDate(width),
              buildOrderList('ออร์เดอร์ทั้งหมด', '100'),
              buildOrderList('ออร์เดอร์ที่อนุมัติ', '90'),
              buildOrderList('ออร์เดอร์ที่ปฏิเสธ', '10'),
              buildOrderList('ออร์เดอร์ที่จัดส่งแล้ว', '90'),
            ],
          ),
        ),
      ),
    );
  }

  Row buildOrderList(String type, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            type,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '$amount  รายการ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Row buildShowAndSelectDate(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 15, bottom: 12),
          child: Text(
            '${filterDate(filterDashboard, type)}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        buildSelectDate(width),
      ],
    );
  }

  Row buildFilterDashboard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [buildMonth(), buildYear()],
    );
  }

  Container buildYear() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15),
      child: ElevatedButton(
        child: focusIncomeYear
            ? const Text(
                'รายปี',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text(
                'รายปี',
                style: TextStyle(color: Colors.grey),
              ),
        onPressed: () {
          setState(() {
            focusIncomeYear = true;
            focusIncomeMonth = false;
            type = 'year';
          });
        },
        style: ElevatedButton.styleFrom(
          primary: focusIncomeYear ? Colors.grey[100] : Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 40),
        ),
      ),
    );
  }

  Container buildMonth() {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 15),
      child: ElevatedButton(
        child: focusIncomeMonth
            ? const Text(
                'รายเดือน',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const Text(
                'รายเดือน',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
        onPressed: () {
          setState(() {
            focusIncomeMonth = true;
            focusIncomeYear = false;
            type = 'month';
          });
        },
        style: ElevatedButton.styleFrom(
          primary: focusIncomeMonth ? Colors.grey[100] : Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 35),
        ),
      ),
    );
  }

  Container buildSelectDate(double width) {
    return Container(
      width: width * .35,
      child: IconButton(
          onPressed: () => setState(() {
                focusSelectDate = true;
              }),
          icon: Icon(Icons.list)),
    );
  }

  Row buildSecondChart(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          width: width * .45,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ออร์เดอร์ที่ปฏิเสธ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                '10',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.pink.shade200,
              Colors.pink.shade400,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: width * .45,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ออร์เดอร์ที่จัดส่งแล้ว',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                '900',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.tealAccent.shade200,
                Colors.tealAccent.shade700,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(20)),
        )
      ],
    );
  }

  Row buildFirstChart(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * .45,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'รายการสินค้าทั้งหมด',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                '1,000',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.pink.shade200,
                Colors.purple.shade400,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: width * .45,
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'ออร์เดอร์ที่อนุมัติ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                '900',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.lightBlue.shade200,
                Colors.blue,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(20)),
        )
      ],
    );
  }
}
