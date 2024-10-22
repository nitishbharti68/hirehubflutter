import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/controllers/jobs_provider.dart';
import 'package:hirehub/models/response/jobs/get_job.dart';
import 'package:hirehub/views/common/BackBtn.dart';
import 'package:hirehub/views/common/app_bar.dart';
import 'package:hirehub/views/common/custom_outline_btn.dart';
import 'package:hirehub/views/common/exports.dart';
import 'package:hirehub/views/common/height_spacer.dart';
import 'package:hirehub/views/common/pages_loader.dart';
import 'package:hirehub/views/common/styled_container.dart';
import 'package:hirehub/views/screens/jobs/widgets/expandable_text.dart';
import 'package:provider/provider.dart';

class JobDetailsPage extends StatefulWidget {
  const JobDetailsPage(
      {super.key,
      required this.id,
      required this.title,
      required this.agentName});

  final String id;
  final String title;
  final String agentName;

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobsNotifier, child) {
        jobsNotifier.getJob(widget.id);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Icon(
                      Fontisto.bookmark,
                      color: Color(kLight.value),
                    ),
                  ),
                )
              ],
              child: const BackBtn(),
            ),
          ),
          body: buildStyleContainer(
            context,
            FutureBuilder<GetJobRes>(
              future: jobsNotifier.job,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: PageLoader(),
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                } else if (snapshot.hasData && snapshot.data != null) {
                  final job = snapshot.data;

                  // Check for null values for all fields
                  if (job == null) {
                    return const Center(
                      child: Text("Job data is null"),
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Stack(
                      children: [
                        ListView(
                          padding: const EdgeInsets.all(5),
                          children: [
                            Container(
                              width: width,
                              height: hieght * 0.27,
                              decoration: BoxDecoration(
                                color: Color(kLightGrey.value),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/images/jobs.png',
                                  ),
                                  opacity: 0.35,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(9)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Safely use the job image if not null or empty
                                  if (job.imageUrl.isNotEmpty)
                                    CircleAvatar(
                                      radius: 30.w,
                                      backgroundImage:
                                          NetworkImage(job.imageUrl),
                                    ),
                                  const HeightSpacer(size: 10),
                                  // Safely use the job title
                                  ReusableText(
                                    text: job.title!,
                                    style: appStyle(
                                      16,
                                      Color(kDark.value),
                                      FontWeight.w600,
                                    ),
                                  ),
                                  const HeightSpacer(size: 5),
                                  ReusableText(
                                    text: job.location!,
                                    style: appStyle(
                                      16,
                                      Color(kDarkGrey.value),
                                      FontWeight.w600,
                                    ),
                                  ),
                                  const HeightSpacer(size: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 50),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomOutlineBtn(
                                            width: width * 0.27,
                                            hieght: hieght * 0.04,
                                            text: job.contract!,
                                            color: Color(kOrange.value)),
                                        Row(
                                          children: [
                                            ReusableText(
                                              text: job.salary!,
                                              style: appStyle(
                                                  16,
                                                  Color(kDark.value),
                                                  FontWeight.w600),
                                            ),
                                            ReusableText(
                                              text: "/${job.period}",
                                              style: appStyle(
                                                  16,
                                                  Color(kDarkGrey.value),
                                                  FontWeight.w600),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const HeightSpacer(size: 20),
                            ReusableText(
                              text: 'Description',
                              style: appStyle(
                                  16, Color(kDark.value), FontWeight.w600),
                            ),
                            const HeightSpacer(size: 10),
                            ExpandableText(job.description!),
                            const HeightSpacer(size: 10),
                            ReusableText(
                              text: 'Requirements',
                              style: appStyle(
                                  16, Color(kDark.value), FontWeight.w600),
                            ),
                            const HeightSpacer(size: 10),
                            SizedBox(
                              height: hieght * 0.4,
                              child: ListView.builder(
                                itemCount: job.requirements.length,
                                itemBuilder: (context, index) {
                                  var requirement = job.requirements[index];
                                  String bullet = '\u2022';
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 12.w),
                                    child: Text(
                                      '$bullet $requirement',
                                      style: appStyle(
                                          12,
                                          Color(kDarkGrey.value),
                                          FontWeight.normal),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20.0.w),
                            child: CustomOutlineBtn(
                              text: 'Please Login',
                              hieght: hieght * 0.06,
                              color: Color(kLight.value),
                              color2: Color(kOrange.value),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("No job data available."),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
