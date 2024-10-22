import 'package:flutter/material.dart';
import 'package:hirehub/views/screens/jobs/widgets/JobsVerticalTile.dart';
import 'package:provider/provider.dart';

import '../../../../constants/app_constants.dart';
import '../../../../controllers/jobs_provider.dart';
import '../../../../models/response/jobs/jobs_response.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<JobsNotifier>(
      builder: (context, jobNotifier, child) {
        jobNotifier.getRecent();
        return SizedBox(
          height: hieght * 0.28,
          child: FutureBuilder<List<JobsResponse>>(
              future: jobNotifier.recentJob,
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
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var job = jobs[index];
                      return JobsVerticalTile(job: job,);
                    },
                  );
                }
              }),
        );
      },
    );
  }
}
