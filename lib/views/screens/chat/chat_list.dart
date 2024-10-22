import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_constants.dart';
import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/drawer/drawer_widget.dart';
import '../../common/reusable_text.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          child: Padding(
            padding: EdgeInsets.all(12.0.h),
            child: DrawerWidget(color: Color(kLightBlue.value)),
          ),
        ),
      ),
      body: Center(
        child: ReusableText(
            text: 'Chat Page',
            style: appStyle(30, Color(kDark.value), FontWeight.bold)),
      ),
    );;
  }
}
