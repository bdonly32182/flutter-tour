import 'package:flutter/material.dart';

class MyConstant {
  // general
  static String appName = 'GoToChan';

  // Route
  static String routeAuthen = '/authen';
  static String routeCreateAccount = '/createAccount';
  static String routeAdminService = '/adminService';
  static String routeSellerService = '/sellerService';
  static String routeBuyerService = '/buyerService';
  static String routeGuideService = '/guideService';
  static String routeMemberList = '/member';

  // image
  static String appLogo = 'images/logo.png';
  static String iconUser = 'images/user.png';
  static String memberPicture = 'images/friendship.png';
  static String locationImage = 'images/location.jpg';
  static String packageTourImage = 'images/packageTour.jpg';
  static String shopImage = 'images/shop.png';
  static String waiting = 'images/waiting.png';
  static String delivery = 'images/delivery.png';
  static String guideImage = 'images/guide.jpg';
  static String partnerImage = 'images/partner.png';
  static String homestayImage = 'images/homestay.jpg';

  // color
  static Color backgroudApp =
      const Color.fromRGBO(243, 241, 245, 1); // box check order this same color
  static Color fontColorSearch = const Color.fromRGBO(200, 198, 198, 1);
  static Color colorStore = const Color.fromRGBO(229, 153, 52, 1);
  static Color colorGuide = const Color.fromRGBO(49, 143, 181, 1);
  static Color themeApp = const Color.fromRGBO(
      41, 187, 137, 1); // this color is themeApp and resort

  // map status
  Map<String, Map<String, dynamic>> statusColor = {
    'Pending': {
      'text': 'สั่งซื้อรอชำระเงิน',
      'color': Color.fromRGBO(255, 202, 3, 1)
    },
    'WaitAccepted': {
      'text': 'รอตรวจสอบใบเสร็จ',
      'color': Color.fromRGBO(49, 143, 181, 1)
    },
    'Accepted': {
      'text': 'ยืนยันการชำระเงิน',
      'color': Color.fromRGBO(110, 203, 99, 1)
    },
    'Rejected': {
      'text': 'ปฏิเสธกาสั่งซื้อ',
      'color': Color.fromRGBO(218, 0, 55, 1)
    },
    'Shipping': {
      'text': 'จัดส่งแล้ว',
      'color': Color.fromRGBO(85, 172, 238, 1)
    },
    'Joined': {
      'text': 'เข้าร่วมทริปแล้ว',
      'color': Color.fromRGBO(85, 172, 238, 1)
    }
  };
  List<String> monthThailand = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฏาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม',
  ];
}
