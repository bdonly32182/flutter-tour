import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyConstant.backgroudApp,
      body: SafeArea(
        child: Column(
          children: [
            buildStackPicture(width, height),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: width * 0.4,
                  height: 40,
                  child: const Text("Name"),
                  decoration: const BoxDecoration(color: Colors.white60),
                ),
                Container(
                  width: width * 0.4,
                  height: 40,
                  child: const Text("Name"),
                  decoration: const BoxDecoration(color: Colors.white60),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: width * 0.86,
              height: 40,
              child: const Text("Phone"),
              decoration: const BoxDecoration(color: Colors.white60),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: width * 0.86,
              height: 40,
              child: const Text("Email"),
              decoration: const BoxDecoration(color: Colors.white60),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: width * 0.36,
              child: ElevatedButton(
                child: Row(
                  children: const [
                    Text("ออกจากระบบ"),
                    Icon(Icons.logout),
                  ],
                ),
                onPressed: () {
                  print("log out");
                },
                style: ElevatedButton.styleFrom(primary: MyConstant.themeApp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Stack buildStackPicture(double width, double height) {
    return Stack(
      children: [
        Container(
          width: width * 1,
          height: height * 0.12,
          decoration: BoxDecoration(
            color: MyConstant.themeApp,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "บัญชีของฉัน",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60.0),
              width: width * 0.24,
              child: ShowImage(pathImage: MyConstant.waiting),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 0.8),
                    blurRadius: 0.4,
                  ),
                ],
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
