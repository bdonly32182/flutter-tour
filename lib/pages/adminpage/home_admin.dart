import 'package:flutter/material.dart';
import 'package:tour_app/pages/adminpage/guide_list.dart';
import 'package:tour_app/pages/adminpage/member.dart';
import 'package:tour_app/pages/adminpage/member_list.dart';
import 'package:tour_app/pages/adminpage/partner_list.dart';
import 'package:tour_app/pages/package_tour.dart';
import 'package:tour_app/pages/tourism_location.dart';
import 'package:tour_app/utils/my_constant.dart';

class HomeAdmin extends StatefulWidget {
  HomeAdmin({Key? key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MyConstant.backgroudApp,
        body: SafeArea(
          child: ListView(
            children: [
              menuCard(
                context,
                width,
                MemberList(),
                MyConstant.memberPicture,
                'สมาชิกในระบบ',
                Colors.green.shade300,
              ),
              menuCard(
                context,
                width,
                PartnerList(),
                MyConstant.partnerImage,
                'พาร์ทเนอร์',
                Colors.orange,
              ),
              menuCard(
                context,
                width,
                PackageTour(isAdmin: true),
                MyConstant.packageTourImage,
                'แพ็คเกจทัวร์',
                Colors.blue.shade300,
              ),
              menuCard(
                context,
                width,
                TourismLocation(isAdmin: true),
                MyConstant.locationImage,
                'แหล่งท่องเที่ยว',
                Colors.purple.shade200,
              ),
              menuCard(
                context,
                width,
                GuideList(),
                MyConstant.guideImage,
                'ไกด์นำเที่ยว',
                Colors.pink.shade200,
              ),
            ],
          ),
        ));
  }

  Card menuCard(BuildContext context, double width, Widget gotoWidget,
      String imageUrl, String? title, Color titleColor) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => gotoWidget)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: width * 0.4,
              child: Image.asset(imageUrl),
            ),
            SizedBox(
              width: width * .5,
              child: Center(
                child: Text(
                  title!,
                  style: TextStyle(
                      color: titleColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: const [
                        Shadow(
                          color: Colors.grey,
                          offset: Offset(0, 2.2),
                          blurRadius: 6,
                        )
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
