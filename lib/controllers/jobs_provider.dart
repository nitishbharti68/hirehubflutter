import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hirehub/constants/app_constants.dart';
import 'package:hirehub/models/request/bookmarks/bookmarks_model.dart';
import 'package:hirehub/models/response/bookmarks/all_bookmarks.dart';
import 'package:hirehub/models/response/jobs/get_job.dart';
import 'package:hirehub/models/response/jobs/jobs_response.dart';
import 'package:hirehub/services/helpers/book_helper.dart';
import 'package:hirehub/services/helpers/jobs_helper.dart';

class JobsNotifier extends ChangeNotifier {
  late Future<List<JobsResponse>> jobList;
  late Future<List<JobsResponse>> recentJob;
  late Future<GetJobRes> job;

  Future<List<JobsResponse>> getJobs() {
    jobList = JobsHelper.getJobs();
    return jobList;
  }

  Future<GetJobRes> getJob(String jobId) {
    job = JobsHelper.getJob(jobId);
    return job;
  }

  Future<List<JobsResponse>> getRecent() {
    recentJob = JobsHelper.getRecent();
    return recentJob;
  }
}
