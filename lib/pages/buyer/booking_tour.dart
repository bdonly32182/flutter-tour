import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';

class BookingTour extends StatefulWidget {
  BookingTour({Key? key}) : super(key: key);

  @override
  _BookingTourState createState() => _BookingTourState();
}

class _BookingTourState extends State<BookingTour> {
  double totalPrice = 0;
  int totalAdult = 0;
  int totalSenior = 0;
  int totalYouth = 0;

  _increaseMember(double price, String type) {
    setState(() {
      if (type == 'adult') {
        totalAdult += 1;
      }
      if (type == 'senior') {
        totalSenior += 1;
      }
      if (type == 'youth') {
        totalYouth += 1;
      }
      totalPrice += price;
    });
  }

  _decreaseMember(double price, String type) {
    setState(() {
      if (type == 'adult') {
        totalAdult -= 1;
      }
      if (type == 'senior') {
        totalSenior -= 1;
      }
      if (type == 'youth') {
        totalYouth -= 1;
      }
      totalPrice -= price;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyConstant.backgroudApp,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildImagePackage(width, height),
              buildColumnInImage(),
              buildStartAndEndDate(),
              Container(
                margin: EdgeInsets.only(top: height * 0.04),
                height: height * 0.338,
                width: width * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'เลือกจำนวนผู้เข้าร่วม',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    buildAdult(width),
                    buildSenior(width),
                    buildYouth(width),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
              ),
              buildTabCheckout(height),
            ],
          ),
        ),
      ),
    );
  }

  Row buildYouth(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'เด็ก (อายุ 6-12)      ',
          style: TextStyle(
            fontSize: 16,
            color: MyConstant.themeApp,
          ),
        ),
        Container(
          width: width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: totalYouth <= 0
                    ? null
                    : () {
                        _decreaseMember(3000, 'youth');
                      },
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: totalYouth < 1 ? Colors.grey[400] : Colors.grey[700],
                ),
                iconSize: 40,
                disabledColor: Colors.grey[400],
              ),
              Text(
                totalYouth.toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: MyConstant.themeApp,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                onPressed: () {
                  _increaseMember(3000, 'youth');
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.grey[700],
                ),
                iconSize: 40,
              ),
            ],
          ),
        )
      ],
    );
  }

  Row buildSenior(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'ผู้สูงอายุ (อายุ 65+)',
          style: TextStyle(
            fontSize: 16,
            color: MyConstant.themeApp,
          ),
        ),
        Container(
          width: width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: totalSenior <= 0
                    ? null
                    : () {
                        _decreaseMember(3200, 'senior');
                      },
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: totalSenior < 1 ? Colors.grey[400] : Colors.grey[700],
                ),
                iconSize: 40,
                disabledColor: Colors.grey[400],
              ),
              Text(
                totalSenior.toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: MyConstant.themeApp,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                onPressed: () {
                  _increaseMember(3200, 'senior');
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.grey[700],
                ),
                iconSize: 40,
              ),
            ],
          ),
        )
      ],
    );
  }

  Row buildAdult(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'ผู้ใหญ่ (อายุ 13-64)',
          style: TextStyle(
            fontSize: 16,
            color: MyConstant.themeApp,
          ),
        ),
        Container(
          width: width * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: totalAdult <= 0
                    ? null
                    : () {
                        _decreaseMember(3500, 'adult');
                      },
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: totalAdult < 1 ? Colors.grey[400] : Colors.grey[700],
                ),
                iconSize: 40,
                disabledColor: Colors.grey[400],
              ),
              Text(
                totalAdult.toString(),
                style: TextStyle(
                    fontSize: 20,
                    color: MyConstant.themeApp,
                    fontWeight: FontWeight.w700),
              ),
              IconButton(
                onPressed: () {
                  _increaseMember(3500, 'adult');
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: Colors.grey[700],
                ),
                iconSize: 40,
              ),
            ],
          ),
        )
      ],
    );
  }

  Container buildTabCheckout(double height) {
    return Container(
      width: double.maxFinite,
      height: height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Total cost',
                style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 16,
                ),
              ),
              Text(
                totalPrice.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          ElevatedButton(
            child: Text(
              'Check Out',
              style: TextStyle(fontSize: 16, color: MyConstant.themeApp),
            ),
            onPressed: () {
              print('Check out');
            },
            style: ElevatedButton.styleFrom(primary: Colors.white),
          ),
        ],
      ),
      decoration: BoxDecoration(color: MyConstant.themeApp),
    );
  }

  Container buildImagePackage(double width, double height) {
    return Container(
      width: width * 1,
      height: height * 0.3,
      child: Stack(
        children: [
          buildArrowBack(),
        ],
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/america.jpg'),
          colorFilter: ColorFilter.mode(
            Colors.white30,
            BlendMode.dst,
          ),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
    );
  }

  Row buildArrowBack() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 10.0, top: 10),
            child: Center(
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
            ),
            width: 50,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  Column buildColumnInImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5.0),
          child: Row(
            children: [
              Text(
                'Package tour name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  // color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 15.0,
            left: 8.0,
          ),
          child: Row(
            children: const [
              Icon(
                Icons.location_on_outlined,
                color: Colors.black54,
              ),
              Text(
                'หาดเจ้าเทียน',
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row buildStartAndEndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: const [
            Icon(Icons.calendar_today),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'พ., ธ.ค. 29',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        const Icon(Icons.arrow_forward),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'พฤ., ธ.ค. 30',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.date_range),
            ),
            Text('1 วัน'),
          ],
        )
      ],
    );
  }
}
