import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hirehub/models/response/jobs/jobs_response.dart';
import 'package:hirehub/views/common/exports.dart';
import 'package:hirehub/views/common/width_spacer.dart';

class VerticalTile extends StatelessWidget {
  const VerticalTile({super.key, this.onTap, required this.job});

  final JobsResponse job; // Job can be null, so we will handle null checks

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    // Null check for the job object before building the UI
    if (job == null) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        height: hieght * 0.15,
        width: width,
        decoration: BoxDecoration(
          color: Color(kLightGrey.value),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Center(
          child: Text(
            'Job information not available',
            style: appStyle(18, Color(kDark.value), FontWeight.w600),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        height: hieght * 0.15,
        width: width,
        decoration: BoxDecoration(
          color: Color(kLightGrey.value),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color(kLightGrey.value),
                      radius: 25,
                      backgroundImage: job!.imageUrl != null
                          ? NetworkImage(job!.imageUrl!)
                          : null, // Handles null imageUrl
                      child: job!.imageUrl == null
                          ? Icon(Icons.person, size: 30) // Placeholder if null
                          : null,
                    ),
                    const WidthSpacer(width: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ReusableText(
                          text: job!.company ?? 'Unknown Company', // Null check
                          style: appStyle(
                              18, Color(kDark.value), FontWeight.w600),
                        ),
                        SizedBox(
                          width: width * 0.5,
                          child: ReusableText(
                            text: job!.title ?? 'Job Title Not Available', // Null check
                            style: appStyle(16, Color(kDarkGrey.value),
                                FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(kLight.value),
                      child: const Icon(Ionicons.chevron_forward),
                    )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Row(
                children: [
                  ReusableText(
                    text: job!.salary ?? 'N/A', // Null check
                    style: appStyle(20, Color(kDark.value), FontWeight.w600),
                  ),
                  ReusableText(
                    text: "/${job!.period ?? 'N/A'}", // Null check
                    style: appStyle(
                        20, Color(kDarkGrey.value), FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
