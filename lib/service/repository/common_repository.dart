import 'package:tinnierenee12/const/app_api_end_point.dart';
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
}
