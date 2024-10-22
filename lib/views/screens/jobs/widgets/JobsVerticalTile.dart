import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/models/response/jobs/jobs_response.dart';
import 'package:hirehub/views/common/exports.dart';
import 'package:hirehub/views/screens/jobs/job_details_page.dart';

class JobsVerticalTile extends StatelessWidget {
  const JobsVerticalTile({super.key, required this.job});

  final JobsResponse job;

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
          height: hieght * 0.12,
          width: width,
          decoration: BoxDecoration(
            color: Color(kLightGrey.value),
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
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(job.imageUrl),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: job.company,
                            style: appStyle(
                                18, Color(kDark.value), FontWeight.w500),
                          ),
                          ReusableText(
                              text: job.title!,
                              style: appStyle(
                                  14, Color(kDarkGrey.value), FontWeight.w500)),
                          ReusableText(
                            text: "${job.salary} per ${job.period}",
                            style: appStyle(
                                14, Color(kDarkGrey.value), FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(kLight.value),
                    child: const Icon(
                      Ionicons.chevron_forward,
                      // color: Color(kOrange.value),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
