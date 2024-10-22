import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/views/common/BackBtn.dart';
import 'package:hirehub/views/common/app_bar.dart';
import 'package:hirehub/views/screens/jobs/widgets/popular_job_list.dart';

class JobListPage extends StatelessWidget {
  const JobListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.w),
          child: const CustomAppBar(
            text: 'Jobs',
            child: BackBtn(),
          )),
      body: PopularJobList(),
    );
  }
}
