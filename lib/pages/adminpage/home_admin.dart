import 'package:flutter/material.dart';
import 'package:tour_app/pages/adminpage/guide_list.dart';
import 'package:tour_app/pages/adminpage/member.dart';
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
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          buildPartner(size),
          buildPackageTour(size),
          buildMeber(size),
          buildTourismLocation(size),
          buildGuide(size)
        ],
      ),
    ));
  }

  Container buildGuide(double size) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Ink.image(
                image: AssetImage(MyConstant.packageTourImage),
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.multiply),
                fit: BoxFit.cover,
                height: 230,
                width: size * 1,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => GuideList()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ไกด์นำเที่ยว',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        'จัดการไกด์นำเที่ยวได้ที่นี่',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black38, blurRadius: 20, offset: const Offset(0, 8))
      ]),
    );
  }

  Container buildMeber(double size) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Ink.image(
                image: AssetImage(MyConstant.memberPicture),
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.multiply),
                fit: BoxFit.cover,
                height: 230,
                width: size * 1.0,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyConstant.routeMemberList);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'สมาชิกในระบบ',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        'ลิสต์รายชื่อสมาชิกทั้งหมด และ',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        ' อนุมัติพาร์ทเนอร์ได้ที่นี่',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black38, blurRadius: 20, offset: const Offset(0, 8))
      ]),
    );
  }

  Container buildTourismLocation(double size) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Ink.image(
                image: AssetImage(MyConstant.tripPicture),
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.multiply),
                fit: BoxFit.cover,
                height: 230,
                width: size * 1,
                child: InkWell(
                  onTap: () {
                    print('click card');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => TourismLocation(isAdmin: true)));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'แหล่งท่องเที่ยว',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        'จัดการแหล่งท่องเที่ยวได้ที่นี่',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black38, blurRadius: 20, offset: const Offset(0, 8))
      ]),
    );
  }

  Container buildPartner(double size) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Ink.image(
                image: AssetImage(MyConstant.shopImage),
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.multiply),
                fit: BoxFit.cover,
                height: 230,
                width: size * 1,
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => PartnerList()));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'พาร์ทเนอร์',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        'จัดการข้อมูล ร้านอาหาร บ้านพัก',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        ' ผลิตภัณฑ์ชุมชน ได้ที่นี่',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black38, blurRadius: 20, offset: const Offset(0, 8))
      ]),
    );
  }

  Container buildPackageTour(double size) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              Ink.image(
                image: AssetImage(MyConstant.packageTourImage),
                colorFilter: ColorFilter.mode(Colors.grey, BlendMode.multiply),
                fit: BoxFit.cover,
                height: 230,
                width: size * 1,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => PackageTour(isAdmin: true)));
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'แพ็คเกจทัวร์',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                      Text(
                        'จัดการแพ็คเกจทัวร์ได้ที่นี่',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black38, blurRadius: 20, offset: const Offset(0, 8))
      ]),
    );
  }
}
