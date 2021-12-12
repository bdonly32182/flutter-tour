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
  static String memberPicture = 'images/member.png';
  static String tripPicture = 'images/trip.png';
  static String packageTourImage = 'images/packagetour.png';
  static String shopImage = 'images/shop.png';
  static String waiting = 'images/waiting.png';
  static String delivery = 'images/delivery.png';

  // map status
  Map<String, Map<String, dynamic>> statusColor = {
    'Pending': {'text': 'สั่งซื้อรอชำระเงิน', 'color': Colors.yellow[700]},
    'WaitAccepted': {'text': 'รอตรวจสอบใบเสร็จ', 'color': Colors.orange[700]},
    'Accepted': {'text': 'ยืนยันการชำระเงิน', 'color': Colors.green[700]},
    'Rejected':{'text': 'ปฏิเสธกาสั่งซื้อ', 'color': Colors.red[700]},
    'Shipping':{'text': 'จัดส่งแล้ว', 'color': Colors.blue[800]},
    'Joined':{'text': 'เข้าร่วมทริปแล้ว', 'color': Colors.blue[800]}
  };

}
