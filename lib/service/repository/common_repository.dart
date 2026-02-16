import 'package:tinnierenee12/const/app_api_end_point.dart';
import 'package:tinnierenee12/models/notification_model/notification_model.dart';
import 'package:tinnierenee12/models/rules_model/rules_model.dart';
import 'package:tinnierenee12/models/statistic_model/statistic_model.dart';
import 'package:tinnierenee12/service/api/api_services.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class CommonRepository {
  CommonRepository._();
  static final CommonRepository instance = CommonRepository._();

  ApiServices apiServices = ApiServices.instance;

  Future<StatisticModelData?> getStatisticData() async {
    try {
      var response = await apiServices.apiGetServices(AppApiEndPoint.statistic);
      if (response != null && response["data"] is Map) {
        return StatisticModelData.fromJson(response["data"]);
      }
    } catch (e) {
      AppPrint.appError(e, title: "getStatisticData");
    }
    return null;
  }

  Future<RulesModelData?> getAppRules({required String status}) async {
    try {
      final response = await apiServices.apiGetServices(
        AppApiEndPoint.termsPrivacyAboutUs(status),
      );
      if (response != null && response["data"] is Map) {
        return RulesModelData.fromJson(response["data"]);
      }
    } catch (e) {
      AppPrint.appError(e, title: "getAppRules");
    }
    return null;
  }

  Future<List<NotificationModelData>> getNotification({
    required int page,
  }) async {
    List<NotificationModelData> notificationList = <NotificationModelData>[];
    try {
      var response = await apiServices.apiGetServices(
        AppApiEndPoint.notification(page),
      );

      if (response != null && response["data"] is List) {
        for (var item in response["data"]) {
          notificationList.add(NotificationModelData.fromJson(item));
        }
      }
    } catch (e) {
      AppPrint.appError(e, title: "getNotification");
    }
    return notificationList;
  }

  Future<bool> updateNotificationStatus({required String id}) async {
    try {
      final response = await apiServices.apiPatchServices(
        url: "${AppApiEndPoint.readNotification}/$id",
      );
      if (response != null && response["data"] != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "updateNotificationStatus");
    }

    return false;
  }

  Future<bool> postCintactUs({
    required String subject,
    required String message,
  }) async {
    Map<String, dynamic> body = {"subject": subject, "message": message};

    try {
      final response = await apiServices.apiPostServices(
        body: body,
        url: AppApiEndPoint.contacyUs,
      );
      if (response["success"] == true) {
        return true;
      } else {
        AppPrint.appError("Error");
        return false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "postCintactUs");
    }
    return false;
  }
}
