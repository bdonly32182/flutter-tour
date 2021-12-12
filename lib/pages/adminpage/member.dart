import 'package:flutter/material.dart';
import 'package:tour_app/pages/adminpage/member_approve.dart';
import 'package:tour_app/pages/adminpage/member_list.dart';

class Member extends StatefulWidget {
  Member({Key? key}) : super(key: key);

  @override
  _MemberState createState() => _MemberState();
}

class _MemberState extends State<Member> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.tealAccent[700],
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.list_alt_outlined),
              ),
              Tab(
                  icon: Icon(
                Icons.approval,
              ))
            ]),
          ),
          body: TabBarView(
            children: [MemberList(), MemberApprove()],
          ),
        ));
  }
}
