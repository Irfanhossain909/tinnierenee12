import 'package:get/get.dart';
import 'package:tinnierenee12/models/job_model/job_complate_model.dart';
import 'package:tinnierenee12/screen/client_shift_screen/controller/client_shift_controller.dart';
import 'package:tinnierenee12/service/repository/job_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class ClientAllSubstituteController extends GetxController {
  //Variables
  RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  String? _jobId;
  final RxList<JobComplateModelData> _substituteList =
      <JobComplateModelData>[].obs;
  RxList<JobComplateModelData> get substituteList => _substituteList;

  ClientShiftController clientShiftController = Get.find();
  //repository
  final JobRepository _jobRepository = JobRepository.instance;
  Future<void> fetchSubstituteList() async {
    try {
      _isLoading.value = true;
      final response = await _jobRepository.getJobsApplyerList(
        page: 1,
        limit: 10,
        jobId: _jobId ?? "",
      );

      if (response.isNotEmpty) {
        _substituteList.addAll(response);
      } else {
        AppPrint.appError("There is no substitute list");
        _isLoading.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "fetchSubstituteList");
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> substituteStatusUpdate({
    required String substituteId,
    required String status,
  }) async {
    try {
      final response = await _jobRepository.employeeAcceptReject(
        empId: substituteId,
        status: status,
      );
      if (response) {
        substituteList.clear();
        await fetchSubstituteList();
        clientShiftController.jobSubstituteList();
      } else {
        AppPrint.appError(
          "Failed to update substitute status",
          title: "substituteStatusUpdate",
        );
      }
    } catch (e) {
      AppPrint.appError(e, title: "substituteStatusUpdate");
    }
  }

  @override
  void onInit() {
    _jobId = Get.arguments;
    fetchSubstituteList();
    super.onInit();
  }
}
