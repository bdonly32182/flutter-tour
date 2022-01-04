import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';

class AmountParticipant extends StatefulWidget {
  AmountParticipant({Key? key}) : super(key: key);

  @override
  _AmountParticipantState createState() => _AmountParticipantState();
}

class _AmountParticipantState extends State<AmountParticipant> {
  int totalRoom = 1;
  int totalAdult = 0;
  int totalYouth = 0;
  int totalBaby = 0;

  _increaseAdult() {
    setState(() {
      totalAdult += 1;
    });
  }

  _decreaseAdult() {
    setState(() {
      totalAdult -= 1;
    });
  }

  _increaseRoom() {
    setState(() {
      totalRoom += 1;
    });
  }

  _decreaseRoom() {
    setState(() {
      totalRoom -= 1;
    });
  }

  _increaseYouth() {
    setState(() {
      totalYouth += 1;
    });
  }

  _decreaseYouth() {
    setState(() {
      totalYouth -= 1;
    });
  }

  _increaseBaby() {
    setState(() {
      totalBaby += 1;
    });
  }

  _decreaseBaby() {
    setState(() {
      totalBaby -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      appBar: AppBar(
        title: Text('จำนวนห้องพักและผู้เข้าพัก'),
        backgroundColor: MyConstant.themeApp,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                buildTotalRoom(width),
                const Divider(),
                buildTotalCustom(
                  width,
                  totalAdult,
                  'ผู้ใหญ่',
                  _increaseAdult,
                  _decreaseAdult,
                ),
                const Divider(),
                buildTotalCustom(
                  width,
                  totalYouth,
                  'เด็ก',
                  _increaseYouth,
                  _decreaseYouth,
                ),
                const Divider(),
                buildTotalCustom(
                  width,
                  totalBaby,
                  'ทารก',
                  _increaseBaby,
                  _decreaseBaby,
                ),
                const Divider(),
              ],
            ),
          ),
          buildButtonOk()
        ],
      ),
    );
  }

  Container buildButtonOk() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(10),
      height: 50,
      child: ElevatedButton(
        child: Text(
          'ตกลง',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          print('go to back filter');
        },
        style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
      ),
    );
  }

  Row buildTotalCustom(double width, int totalEachType, String typeName,
      Function increaseTotal, Function decreaseTotal) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: width * 0.1,
          child: Text(
            totalEachType.toString(),
            style: TextStyle(fontSize: 24),
          ),
        ),
        SizedBox(
          width: width * 0.3,
          child: Text(
            typeName,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          width: width * 0.3,
          child: Row(
            children: [
              IconButton(
                onPressed: totalEachType <= 0 ? null : () => decreaseTotal(),
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color: totalEachType <= 0
                      ? Colors.grey[400]
                      : MyConstant.themeApp,
                ),
                iconSize: 40,
                disabledColor: Colors.grey[400],
              ),
              IconButton(
                onPressed: () => increaseTotal(),
                icon: Icon(
                  Icons.add_circle_outline,
                  color: MyConstant.themeApp,
                ),
                iconSize: 40,
              )
            ],
          ),
        ),
      ],
    );
  }

  Row buildTotalRoom(double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: width * 0.1,
          child: Text(
            totalRoom.toString(),
            style: TextStyle(fontSize: 24),
          ),
        ),
        SizedBox(
          width: width * 0.3,
          child: Text(
            'ห้อง',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          width: width * 0.3,
          child: Row(
            children: [
              IconButton(
                onPressed: totalRoom <= 1
                    ? null
                    : () {
                        setState(() {
                          totalRoom -= 1;
                        });
                      },
                icon: Icon(
                  Icons.remove_circle_outline_rounded,
                  color:
                      totalRoom <= 1 ? Colors.grey[400] : MyConstant.themeApp,
                ),
                iconSize: 40,
                disabledColor: Colors.grey[400],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    totalRoom += 1;
                  });
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: MyConstant.themeApp,
                ),
                iconSize: 40,
              )
            ],
          ),
        ),
      ],
    );
  }
}
