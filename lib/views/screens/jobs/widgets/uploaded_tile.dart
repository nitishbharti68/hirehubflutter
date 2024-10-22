import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hirehub/models/response/jobs/jobs_response.dart';
import 'package:hirehub/views/common/custom_outline_btn.dart';

import '../../../../constants/app_constants.dart';
import '../../../common/app_style.dart';
import '../../../common/reusable_text.dart';
import '../job_details_page.dart';

class UploadedTile extends StatelessWidget {
  const UploadedTile({super.key, required this.job, required this.text});

  final JobsResponse job;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => JobDetailsPage(
            id: job.id, title: job.title!, agentName: job.agentName));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          height: hieght * 0.1,
          width: width,
          decoration: BoxDecoration(
            color: const Color(0x09000000),
            borderRadius: BorderRadius.all(
              Radius.circular(9.w),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(job.imageUrl),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: job.company,
                            style: appStyle(
                                12, Color(kDark.value), FontWeight.w500),
                          ),
                          ReusableText(
                            text: job.title!,
                            style: appStyle(
                                12, Color(kDarkGrey.value), FontWeight.w500),
                          ),
                          ReusableText(
                            text: "${job.salary} per ${job.period}",
                            style: appStyle(
                                12, Color(kDarkGrey.value), FontWeight.w500),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // This Spacer pushes the button to the end
                  Spacer(),
                  CustomOutlineBtn(
                    hieght: 36.h,
                    width: 90.w,
                    text: text == 'popular' ? "View" : "Apply",
                    color: Color(kOrange.value),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
