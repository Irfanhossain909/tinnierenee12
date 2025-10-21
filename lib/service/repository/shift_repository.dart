import 'package:tinnierenee12/const/app_api_end_point.dart';
import 'package:tinnierenee12/models/shift_model/find_shift_model.dart';
import 'package:tinnierenee12/models/shift_model/my_shift_model.dart';
import 'package:tinnierenee12/service/api/api_services.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class ShiftRepository {
  ShiftRepository._();

  static final ShiftRepository _instance = ShiftRepository._();
  static ShiftRepository get instance => _instance;

  final ApiServices _apiServices = ApiServices.instance;

  Future<List<MyShiftModelData>> getMyShift({
    required int page,
    required int limit,
  }) async {
    List<MyShiftModelData> myShift = <MyShiftModelData>[];

    try {
      final response = await _apiServices.apiGetServices(
        AppApiEndPoint.myShift(page, limit),
      );

      if (response != null && response["data"] != null) {
        for (var item in response["data"]) {
          myShift.add(MyShiftModelData.fromJson(item));
        }
      }
    } catch (e) {
      AppPrint.appError("getMyShift");
    }
    return myShift;
  }

  Future<List<FindShiftModelData>> getFindShift({
    required int page,
    required int limit,
    required double lat,
    required double lng,
    required double distance,
    required int priceGte,
    required int priceLte,
    required String ageGroup,
  }) async {
    List<FindShiftModelData> findShift = <FindShiftModelData>[];

    try {
      // ✅ Build query params map dynamically
      final Map<String, dynamic> queryParams = {};

      if (page > 0) queryParams['page'] = page;
      if (limit > 0) queryParams['limit'] = limit;
      if (lat != 0.0) queryParams['lat'] = lat;
      if (lng != 0.0) queryParams['lng'] = lng;
      if (distance > 0) queryParams['distance'] = distance;
      if (priceGte > 0) queryParams['price[gte]'] = priceGte;
      if (priceLte > 0) queryParams['price[lte]'] = priceLte;
      if (ageGroup.isNotEmpty) queryParams['ageGroup'] = ageGroup;

      // ✅ Pass map to your API service
      final response = await _apiServices.apiGetServices(
        AppApiEndPoint.findShift,
        queryParameters: queryParams,
      );

      // ✅ Parse response
      if (response != null && response["data"] != null) {
        for (var item in response["data"]) {
          findShift.add(FindShiftModelData.fromJson(item));
        }
      }
    } catch (e) {
      AppPrint.appError("getFindShift error: $e");
    }

    return findShift;
  }

  // Future<List<FindShiftModelData>> getFindShift({
  //   required int page,
  //   required int limit,
  //   required double lat,
  //   required double lng,
  //   required double distance,
  //   required int priceGte,
  //   required int priceLte,
  //   required String ageGroup,
  // }) async {
  //   List<FindShiftModelData> findShift = <FindShiftModelData>[];

  //   try {
  //     final response = await _apiServices.apiGetServices(
  //       AppApiEndPoint.findShift(
  //         page,
  //         limit,
  //         lat,
  //         lng,
  //         distance,
  //         priceGte,
  //         priceLte,
  //         ageGroup,
  //       ),
  //     );

  //     if (response != null && response["data"] != null) {
  //       for (var item in response["data"]) {
  //         findShift.add(FindShiftModelData.fromJson(item));
  //       }
  //     }
  //   } catch (e) {
  //     AppPrint.appError("getMyShift");
  //   }
  //   return findShift;
  // }

  Future<bool> applyShift({required String job, required String status}) async {
    Map<String, dynamic> body = {"status": status, "job": job};

    try {
      final response = await _apiServices.apiPostServices(
        url: AppApiEndPoint.shiftApply,
        body: body,
      );
      if (response != null && response["success"] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "updateShift");
    }
    return false;
  }
}
