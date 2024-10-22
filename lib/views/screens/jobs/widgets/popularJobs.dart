import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/controllers/jobs_provider.dart';
import 'package:hirehub/models/response/jobs/jobs_response.dart';
import 'package:hirehub/views/screens/jobs/job_details_page.dart';
import 'package:hirehub/views/screens/jobs/widgets/JobsHorizontalTile.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_constants.dart';

class PopularJobs extends StatelessWidget {
  const PopularJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobNotifier, child) {
        jobNotifier.getJobs();
        return SizedBox(
          height: hieght * 0.24,
          child: FutureBuilder<List<JobsResponse>>(
            future: jobNotifier.jobList,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.data!.isEmpty) {
                return const Text('No Jobs Available');
              } else {
                final jobs = snapshot.data;

                return ListView.builder(
                    itemCount: jobs!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var job = jobs[index];
                      return JobsHorizontalTile(
                        job: job,
                        onTap: () {
                          Get.to(() => JobDetailsPage(
                                id: job.id,
                                title: job.title!,
                                agentName: job.agentName,
                              ));
                        },
                      );
                    });
              }
            },
          ),
        );
      },
    );
  }
}
