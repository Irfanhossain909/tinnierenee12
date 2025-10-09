import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tinnierenee12/models/job_model/job_complate_model.dart';
import 'package:tinnierenee12/models/job_model/job_model.dart';
import 'package:tinnierenee12/models/job_model/substitute_model.dart';
import 'package:tinnierenee12/service/repository/job_repository.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class ClientShiftController extends GetxController {
  //variables
  RxString selectedValue = "".obs;

  RxList<JobModelData> jobsList = <JobModelData>[].obs;
  RxList<JobComplateModelData> jobBookedComplateList =
      <JobComplateModelData>[].obs;
  RxList<SubstituteModelData> jobSubstituteList = <SubstituteModelData>[].obs;

  //repository
  JobRepository jobRepository = JobRepository.instance;

  void setvalue(value) {
    selectedValue.value = value;
    if (value == "active") {
      fetchJobData(value: value);
    }
    if (value == "completed") {
      fetchJobBookedComplateData();
    }
    if (value == "booked") {
      fetchJobSubstituteData();
    }
  }

  @override
  void dispose() {
    jobListStrollController.dispose();
    jobCompleteListScrollController.dispose();
    jobSubstituteListScrollController.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    setvalue("active");
    selectedValue.value = "active";

    // Add scroll listeners for all lists
    jobListStrollController.addListener(_jobListScrollListener);
    jobCompleteListScrollController.addListener(_jobCompleteListScrollListener);
    jobSubstituteListScrollController.addListener(
      _jobSubstituteListScrollListener,
    );
    super.onInit();
  }

  ///////Func Job Data///////////////////////////////
  // Active Jobs Pagination
  final jobListStrollController = ScrollController();
  RxBool isJobListMoreLoad = true.obs;
  RxBool isLoadingJobs = false.obs;
  RxBool isPaginationLoading = false.obs;
  int jobPage = 1;
  int limit = 6;

  // Completed Jobs Pagination
  final jobCompleteListScrollController = ScrollController();
  RxBool isJobCompleteListMoreLoad = true.obs;
  RxBool isLoadingCompleteJobs = false.obs;
  RxBool isPaginationLoadingComplete = false.obs;
  int jobCompletePage = 1;
  int completeLimit = 6;

  // Substitute Jobs Pagination
  final jobSubstituteListScrollController = ScrollController();
  RxBool isJobSubstituteListMoreLoad = true.obs;
  RxBool isLoadingSubstituteJobs = false.obs;
  RxBool isPaginationLoadingSubstitute = false.obs;
  int jobSubstitutePage = 1;
  int substituteLimit = 6;
  ///////////////////////////////////////////////////////////////////////
  // Generic pagination function
  Future<void> _handlePagination({
    required String listType,
    required Future<List<dynamic>> Function(int page, int limit) fetchFunction,
    required RxList list,
    required RxBool isLoading,
    required RxBool isPaginationLoading,
    required RxBool isMoreLoad,
    required int page,
    required int limit,
    required Function(int) updatePage,
    bool isPagination = false,
  }) async {
    try {
      if (isPagination) {
        isPaginationLoading.value = true;
      } else {
        isLoading.value = true;
      }

      final response = await fetchFunction(page, limit);

      if (response.isNotEmpty) {
        AppPrint.apiResponse(list.length, title: "$listType after clear");
        list.value += response;
        AppPrint.apiResponse(list.length, title: "$listType after adding");
      } else {
        isMoreLoad.value = false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "fetch$listType");
    } finally {
      if (isPagination) {
        isPaginationLoading.value = false;
      } else {
        isLoading.value = false;
      }
    }
  }

  // Active Jobs Functions
  Future<void> fetchJobData({
    required String value,
    bool isPagination = false,
  }) async {
    await _handlePagination(
      listType: "JobData",
      fetchFunction: (page, limit) =>
          jobRepository.getJobs(status: value, page: page, limit: limit),
      list: jobsList,
      isLoading: isLoadingJobs,
      isPaginationLoading: isPaginationLoading,
      isMoreLoad: isJobListMoreLoad,
      page: jobPage,
      limit: limit,
      updatePage: (newPage) => jobPage = newPage,
      isPagination: isPagination,
    );
  }

  void _jobListScrollListener() {
    if (isJobListMoreLoad.value == false || isPaginationLoading.value) return;
    if (jobListStrollController.position.pixels ==
        jobListStrollController.position.maxScrollExtent) {
      AppPrint.apiResponse("fetching more active jobs data");
      jobPage++;
      fetchJobData(value: selectedValue.value, isPagination: true);
    }
  }

  Future<void> jobListRefresh() async {
    jobPage = 1;
    isJobListMoreLoad.value = true;
    jobsList.clear();
    await fetchJobData(value: selectedValue.value);
  }

  // Completed Jobs Functions
  Future<void> fetchJobBookedComplateData({bool isPagination = false}) async {
    await _handlePagination(
      listType: "JobCompleteData",
      fetchFunction: (page, limit) =>
          jobRepository.getJobsBookedComplate(page: page, limit: limit),
      list: jobBookedComplateList,
      isLoading: isLoadingCompleteJobs,
      isPaginationLoading: isPaginationLoadingComplete,
      isMoreLoad: isJobCompleteListMoreLoad,
      page: jobCompletePage,
      limit: completeLimit,
      updatePage: (newPage) => jobCompletePage = newPage,
      isPagination: isPagination,
    );
  }

  void _jobCompleteListScrollListener() {
    if (isJobCompleteListMoreLoad.value == false ||
        isPaginationLoadingComplete.value) return;
    if (jobCompleteListScrollController.position.pixels ==
        jobCompleteListScrollController.position.maxScrollExtent) {
      AppPrint.apiResponse("fetching more completed jobs data");
      jobCompletePage++;
      fetchJobBookedComplateData(isPagination: true);
    }
  }

  Future<void> jobCompleteListRefresh() async {
    jobCompletePage = 1;
    isJobCompleteListMoreLoad.value = true;
    jobBookedComplateList.clear();
    await fetchJobBookedComplateData();
  }

  // Substitute Jobs Functions
  Future<void> fetchJobSubstituteData({bool isPagination = false}) async {
    await _handlePagination(
      listType: "JobSubstituteData",
      fetchFunction: (page, limit) =>
          jobRepository.getJobsSubstitute(page: page, limit: limit),
      list: jobSubstituteList,
      isLoading: isLoadingSubstituteJobs,
      isPaginationLoading: isPaginationLoadingSubstitute,
      isMoreLoad: isJobSubstituteListMoreLoad,
      page: jobSubstitutePage,
      limit: substituteLimit,
      updatePage: (newPage) => jobSubstitutePage = newPage,
      isPagination: isPagination,
    );
  }

  void _jobSubstituteListScrollListener() {
    if (isJobSubstituteListMoreLoad.value == false ||
        isPaginationLoadingSubstitute.value)
      return;
    if (jobSubstituteListScrollController.position.pixels ==
        jobSubstituteListScrollController.position.maxScrollExtent) {
      AppPrint.apiResponse("fetching more substitute jobs data");
      jobSubstitutePage++;
      fetchJobSubstituteData(isPagination: true);
    }
  }

  Future<void> jobSubstituteListRefresh() async {
    jobSubstitutePage = 1;
    isJobSubstituteListMoreLoad.value = true;
    jobSubstituteList.clear();
    await fetchJobSubstituteData();
  }
}
