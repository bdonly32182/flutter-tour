import 'package:flutter/material.dart';
import 'package:tour_app/utils/my_constant.dart';

class CreateAccount extends StatefulWidget {
  CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool focusEmail = false;
  bool focusPhone = false;
  bool focusName = false;
  bool focusPassword = false;
  bool focusConfirmPass = false;
  bool eyesPassword = true;
  bool eyesConfirm = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
            behavior: HitTestBehavior.opaque,
            child: Form(
              child: ListView(
                children: [
                  buildNameRoute(size),
                  buildEmail(size),
                  buildPassword(size),
                  buildConfirmPassword(size),
                  buildName(size),
                  buildPhone(size),
                  buildButton(size),
                  buildLogin(size)
                ],
              ),
            )),
      ),
    );
  }

  Row buildNameRoute(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.5,
          child: Text('สร้างบัญชีผู้ใช้งาน',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w800)),
        ),
      ],
    );
  }

  Container buildLogin(double size) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: size * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('มีบัญชีผู้ใช้งานอยู่แล้ว ? '),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MyConstant.routeAuthen, (route) => false);
            },
            child: Text(' กลับสู่หน้าล็อกอิน ',
                style: TextStyle(color: Colors.tealAccent[700])),
          )
        ],
      ),
    );
  }

  Row buildButton(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.5,
          child: ElevatedButton(
            onPressed: () => {print('user')},
            child: Text(
              'สมัครสมาชิก',
              style: TextStyle(fontSize: 18),
            ),
            style: ElevatedButton.styleFrom(primary: Colors.tealAccent[700]),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusPassword &&
                        focusEmail &&
                        focusPhone &&
                        focusName &&
                        focusConfirmPass
                    ? Colors.tealAccent.shade100
                    : Colors.white,
                blurRadius: 20,
                offset: const Offset(0, 5))
          ]),
        )
      ],
    );
  }

  Row buildPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.7,
          child: TextFormField(
            controller: passwordController,
            obscureText: eyesPassword,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusPassword = false;
              } else {
                focusPassword = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'Please fill username';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'รหัสผ่าน :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                suffixIcon: IconButton(
                  icon: eyesPassword
                      ? Icon(Icons.remove_red_eye,
                          color: focusPassword
                              ? Colors.tealAccent[700]
                              : Colors.grey)
                      : Icon(Icons.remove_red_eye_outlined,
                          color: focusPassword
                              ? Colors.tealAccent[700]
                              : Colors.grey),
                  onPressed: () => setState(() {
                    eyesPassword = !eyesPassword;
                  }),
                ),
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color: focusPassword ? Colors.tealAccent[700] : Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusPassword ? FontWeight.w900 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusPassword ? Colors.black26 : Colors.white,
                blurRadius: 20,
                offset: const Offset(0, 8))
          ]),
        )
      ],
    );
  }

  Row buildEmail(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: size * 0.7,
          child: TextFormField(
            controller: emailController,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusEmail = false;
              } else {
                focusEmail = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'Please fill username';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'อีเมล :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: focusEmail ? Colors.tealAccent[700] : Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusEmail ? FontWeight.w900 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusEmail ? Colors.black26 : Colors.white,
                blurRadius: 25,
                offset: const Offset(0, 8))
          ]),
        )
      ],
    );
  }

  Row buildPhone(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.7,
          child: TextFormField(
            controller: phoneController,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusPhone = false;
              } else {
                focusPhone = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'Please fill username';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'เบอร์โทรศัพท์ :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: focusPhone ? Colors.tealAccent[700] : Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusPhone ? FontWeight.w900 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusPhone ? Colors.black26 : Colors.white,
                blurRadius: 25,
                offset: const Offset(0, 8))
          ]),
        )
      ],
    );
  }

  Row buildName(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.7,
          child: TextFormField(
            controller: nameController,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusName = false;
              } else {
                focusName = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'Please fill username';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'ชื่อ - นามสกุล :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: focusName ? Colors.tealAccent[700] : Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight: focusName ? FontWeight.w900 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusName ? Colors.black26 : Colors.white,
                blurRadius: 25,
                offset: const Offset(0, 8))
          ]),
        )
      ],
    );
  }

  Row buildConfirmPassword(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: size * 0.7,
          child: TextFormField(
            controller: confirmPassController,
            obscureText: eyesConfirm,
            onChanged: (text) => setState(() {
              if (text.isEmpty) {
                focusConfirmPass = false;
              } else {
                focusConfirmPass = true;
              }
            }),
            validator: (value) {
              if (value!.isEmpty) return 'Please fill username';
              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                labelText: 'ยืนยันรหัสผ่าน :',
                labelStyle: TextStyle(color: Colors.grey[600]),
                suffixIcon: IconButton(
                  icon: eyesConfirm
                      ? Icon(Icons.remove_red_eye,
                          color: focusConfirmPass
                              ? Colors.tealAccent[700]
                              : Colors.grey)
                      : Icon(Icons.remove_red_eye_outlined,
                          color: focusConfirmPass
                              ? Colors.tealAccent[700]
                              : Colors.grey),
                  onPressed: () => setState(() {
                    eyesConfirm = !eyesConfirm;
                  }),
                ),
                prefixIcon: Icon(
                  Icons.lock_outlined,
                  color:
                      focusConfirmPass ? Colors.tealAccent[700] : Colors.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                )),
            style: TextStyle(
                color: Colors.tealAccent[700],
                fontWeight:
                    focusConfirmPass ? FontWeight.w900 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusConfirmPass ? Colors.black26 : Colors.white,
                blurRadius: 20,
                offset: const Offset(0, 8))
          ]),
        )
      ],
    );
  }
}
