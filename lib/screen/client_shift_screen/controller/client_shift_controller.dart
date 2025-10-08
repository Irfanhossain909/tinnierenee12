import 'package:get/get.dart';
import 'package:tinnierenee12/models/job_model/job_model.dart';
import 'package:tinnierenee12/service/repository/job_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class ClientShiftController extends GetxController {
  //variables
  RxString selectedValue = "".obs;
  RxBool isLoadingJobs = false.obs;
  RxList<JobModelData> jobsList = <JobModelData>[].obs;

  //repository
  JobRepository jobRepository = JobRepository.instance;

  void setvalue(value) {
    selectedValue.value = value;
    fetchJobData(value: value);
  }

  @override
  void onInit() {
    setvalue("active");
    selectedValue.value = "active";
    super.onInit();
  }

  Future<void> fetchJobData({required String value}) async {
    try {
      isLoadingJobs.value = true;
      final response = await jobRepository.getJobs(
        status: value,
        page: 1,
        limit: 10,
      );

      jobsList.clear();
      AppPrint.apiResponse(jobsList.length, title: "after clear");
      jobsList.value = response;
      AppPrint.apiResponse(jobsList.length, title: "after adding");
    } catch (e) {
      AppPrint.appError(e, title: "fetchJobData");
    } finally {
      isLoadingJobs.value = false;
    }
  }
}
