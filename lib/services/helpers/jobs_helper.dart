
import 'package:http/http.dart' as https;
import 'package:hirehub/models/response/jobs/get_job.dart';
import 'package:hirehub/models/response/jobs/jobs_response.dart';
import 'package:hirehub/services/config.dart';

class JobsHelper {
  static var client = https.Client();
  static Future<List<JobsResponse>> getJobs() async {
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.jobs);
    // print(url);

    var response = await client.get(url, headers: requestHeaders);

    if(response.statusCode == 200){
      var jobList = jobsResponseFromJson(response.body);
      return jobList;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  static Future<GetJobRes> getJob(String jobId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.https(Config.apiUrl, "${Config.jobs}/$jobId");
    var response = await client.get(url, headers: requestHeaders);

    if (response.statusCode == 200) {
      try {
        var job = getJobResFromJson(response.body);
        return job;
      } catch (e) {
        throw Exception('Error parsing JSON: $e');
      }
    } else {
      throw Exception('Failed to load job');
    }
  }

  static Future<List<JobsResponse>> getRecent() async {
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
    };

    var url = Uri.https(Config.apiUrl, Config.jobs, {"new": "true"});

    var response = await client.get(url, headers: requestHeaders);

    if(response.statusCode == 200){
      var jobList = jobsResponseFromJson(response.body);
      return jobList;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  static Future<List<JobsResponse>> searchJobs(String query) async {
    Map<String, String> requestHeaders = {
      'Content-Type' : 'application/json',
    };

    var url = Uri.https(Config.apiUrl, "${Config.search}/$query");
    print(url);

    var response = await client.get(url, headers: requestHeaders);

    if(response.statusCode == 200){
      var jobList = jobsResponseFromJson(response.body);
      return jobList;
    } else {
      throw Exception('Failed to load jobs');
    }
  }

}
