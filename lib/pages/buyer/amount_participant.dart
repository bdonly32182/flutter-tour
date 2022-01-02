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

  @override
  Widget build(BuildContext context) {
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
                buildTotalRoom(),
                buildTotalAdult(),
                buildTotalYouth(),
                buildTotalBaby(),
              ],
            ),
          ),
          Container(
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
          )
        ],
      ),
    );
  }

  Row buildTotalBaby() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(totalBaby.toString()),
        Text('ทารก (ต่ำกว่า 3 ปี)'),
        IconButton(
          onPressed: totalBaby <= 0
              ? null
              : () {
                  setState(() {
                    totalBaby -= 1;
                  });
                },
          icon: Icon(
            Icons.remove_circle_outline_rounded,
            color: totalBaby <= 0 ? Colors.grey[400] : Colors.grey[700],
          ),
          iconSize: 40,
          disabledColor: Colors.grey[400],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              totalBaby += 1;
            });
          },
          icon: Icon(
            Icons.add_circle_outline,
          ),
          iconSize: 40,
        )
      ],
    );
  }

  Row buildTotalYouth() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(totalYouth.toString()),
        Text('เด็ก'),
        IconButton(
          onPressed: totalYouth <= 0
              ? null
              : () {
                  setState(() {
                    totalYouth -= 1;
                  });
                },
          icon: Icon(
            Icons.remove_circle_outline_rounded,
            color: totalYouth <= 0 ? Colors.grey[400] : Colors.grey[700],
          ),
          iconSize: 40,
          disabledColor: Colors.grey[400],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              totalYouth += 1;
            });
          },
          icon: Icon(
            Icons.add_circle_outline,
          ),
          iconSize: 40,
        )
      ],
    );
  }

  Row buildTotalAdult() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(totalAdult.toString()),
        Text('ผู้ใหญ่'),
        IconButton(
          onPressed: totalAdult <= 0
              ? null
              : () {
                  setState(() {
                    totalAdult -= 1;
                  });
                },
          icon: Icon(
            Icons.remove_circle_outline_rounded,
            color: totalAdult <= 0 ? Colors.grey[400] : Colors.grey[700],
          ),
          iconSize: 40,
          disabledColor: Colors.grey[400],
        ),
        IconButton(
          onPressed: () {
            setState(() {
              totalAdult += 1;
            });
          },
          icon: Icon(
            Icons.add_circle_outline,
          ),
          iconSize: 40,
        )
      ],
    );
  }

  Row buildTotalRoom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(totalRoom.toString()),
        Text('ห้อง'),
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
            color: totalRoom <= 1 ? Colors.grey[400] : Colors.grey[700],
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
          ),
          iconSize: 40,
        )
      ],
    );
  }
}
