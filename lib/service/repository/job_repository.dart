import 'package:tinnierenee12/const/app_api_end_point.dart';
import 'package:tinnierenee12/models/job_model/job_model.dart';
import 'package:tinnierenee12/service/api/api_services.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class JobRepository {
  JobRepository._();
  static final JobRepository instance = JobRepository._();

  ApiServices apiServices = ApiServices.instance;

  Future<bool> addJob({
    required String title,
    required String description,
    required String qualification,
    required String ageGroup,
    required int price,
    required String startDate,
    required String endDate,
    required String startTime,
    required String endTime,
    required double lat,
    required double lng,
  }) async {
    try {
      Map<String, dynamic> body = {
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
        "startTime": startTime,
        "endTime": endTime,
        "lat": lat,
        "lng": lng,
        "description": description,
        "qualification": qualification,
        "ageGroup": ageGroup,
        "price": price,
      };

      final response = await apiServices.apiPostServices(
        url: AppApiEndPoint.job,
        body: body,
      );

      if (response != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "addJob");
    }
    return false;
  }

  Future<List<JobModelData>> getJobs({
    required String status,
    required int page,
    required int limit,
  }) async {
    List<JobModelData> jobs = <JobModelData>[];
    try {
      final response = await apiServices.apiGetServices(
        AppApiEndPoint.jobCategory(status, page, limit),
      );

      if (response != null) {
        if (response["data"] != null && response["data"] is List) {
          for (var item in response["data"]) {
            jobs.add(JobModelData.fromJson(item));
          }
        }
      } else {
        AppPrint.appError("No Data Found", title: "getJobs");
      }
    } catch (e) {
      AppPrint.appError(e, title: "getJobs");
    }
    return jobs;
  }
}
