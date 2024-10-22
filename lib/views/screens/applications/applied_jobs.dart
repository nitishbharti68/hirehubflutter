import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/views/common/drawer/drawer_widget.dart';

import '../../common/app_bar.dart';
import '../../common/app_style.dart';
import '../../common/reusable_text.dart';
import '../auth/profile_page.dart';

class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  String imageUrl = '';
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
            text: 'Applied Jobs Page',
            style: appStyle(30, Color(kDark.value), FontWeight.bold)),
      ),
    );
    ;
  }
}
