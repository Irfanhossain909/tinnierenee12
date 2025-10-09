import 'package:get/get.dart';
import 'package:tinnierenee12/models/job_model/job_model.dart';
import 'package:tinnierenee12/models/statistic_model/statistic_model.dart';
import 'package:tinnierenee12/screen/app_navigation_for_client_screen%20copy/controller/navigation_screen_for_client_controller.dart';
import 'package:tinnierenee12/screen/profile_section/profile_screen/controller/profile_controller.dart';
import 'package:tinnierenee12/service/repository/common_repository.dart';
import 'package:tinnierenee12/service/repository/job_repository.dart';
import 'package:tinnierenee12/utils/location_utils/location_utils.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';
RxString userAddress = "".obs;
class ClientHomeController extends GetxController {
  ProfileController profileController = Get.find<ProfileController>();
  AppNavigationForClientController navController =
      Get.find<AppNavigationForClientController>();

  // RxString userAddress = "".obs;
  //repositories
  CommonRepository commonRepository = CommonRepository.instance;
  JobRepository jobRepository = JobRepository.instance;

  ///loading
  RxBool isLoadingStatistic = false.obs;
  RxBool isLoadingJobs = false.obs;
  Rxn<StatisticModelData> statisticModel = Rxn<StatisticModelData>();
  RxList<JobModelData> jobsList = <JobModelData>[].obs;

  @override
  void onInit() async {
    super.onInit();

    AppPrint.apiResponse(
      "lat long${profileController.profileData.value?.latitude},${profileController.profileData.value?.longitude}",
    );
    fetchStatisticData();
    fetchJobData();
    await profileController.fetchProfileData();
    userAddress.value = await getLocationFromLatLong(
      profileController.profileData.value?.latitude,
      profileController.profileData.value?.longitude,
    );
  }

  /////Functions

  Future<void> fetchStatisticData() async {
    try {
      isLoadingStatistic.value = true;
      final response = await commonRepository.getStatisticData();
      if (response != null) {
        statisticModel.value = response;
        isLoadingStatistic.value = false;
        update();
      } else {
        AppPrint.appError("reswponse is null");
        isLoadingStatistic.value = false;
      }
    } catch (e) {
      isLoadingStatistic.value = false;
      AppPrint.appError(e, title: "fetchStatisticData");
    } finally {
      isLoadingStatistic.value = false;
    }
  }

  Future<void> fetchJobData() async {
    try {
      isLoadingJobs.value = true;
      final response = await jobRepository.getJobs(
        status: "active",
        page: 1,
        limit: 2,
      );
      if (response.isNotEmpty) {
        jobsList.value = response;
        AppPrint.apiResponse(jobsList.first.endDate);
      } else {
        AppPrint.appError("response is null");
      }
    } catch (e) {
      AppPrint.appError(e, title: "fetchJobData");
    } finally {
      isLoadingJobs.value = false;
    }
  }
}
