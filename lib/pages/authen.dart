import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tour_app/pages/create_account.dart';
import 'package:tour_app/utils/my_constant.dart';
import 'package:tour_app/widgets/show_image.dart';

class Authen extends StatefulWidget {
  Authen({Key? key}) : super(key: key);

  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  final formKey = GlobalKey<FormState>();
  bool focusUsername = false;
  bool focusPassword = false;
  bool eyesPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                buildImage(size),
                buildText("Let's Go Chan",
                    TextStyle(fontSize: 26, fontWeight: FontWeight.w900), 10),
                buildText(
                    'Sign to continue',
                    TextStyle(
                        fontSize: 16,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500),
                    0),
                buildEmail(size),
                buildPassword(size),
                buildButton(size),
                buildCreateAccount(size)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildCreateAccount(double size) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      width: size * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("ยังไม่มีบัญชีผู้ใช้งาน ? "),
          InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, MyConstant.routeCreateAccount, (route) => false);
            },
            child: Text(' สร้างบัญชีผู้ใช้งานใหม่',
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
            child: Text('เข้าสู่ระบบ', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(primary: Colors.tealAccent[700]),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusPassword && focusUsername
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
                focusUsername = false;
              } else {
                focusUsername = true;
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
                  color: focusUsername ? Colors.tealAccent[700] : Colors.grey,
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
                    focusUsername ? FontWeight.w900 : FontWeight.normal),
          ),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: focusUsername ? Colors.black26 : Colors.white,
                blurRadius: 25,
                offset: const Offset(0, 8))
          ]),
        )
      ],
    );
  }
}

Row buildText(String title, TextStyle style, double margin) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        margin: EdgeInsets.only(top: margin),
        child: Text(title, style: style),
      )
    ],
  );
}

Container buildImage(double size) {
  return Container(
    margin: EdgeInsets.only(top: 90),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: size * 0.3,
          child: ShowImage(
            pathImage: MyConstant.iconUser,
          ),
        )
      ],
    ),
  );
}
