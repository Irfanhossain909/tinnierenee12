import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:tinnierenee12/const/app_api_end_point.dart';
import 'package:tinnierenee12/models/profile/profile_model.dart';
import 'package:tinnierenee12/service/api/api_services.dart';
import 'package:tinnierenee12/service/api/get_storage_services.dart';
import 'package:tinnierenee12/widget/app_log/app_print.dart';

class ProfileRepository {
  ProfileRepository._();
  static final ProfileRepository instance = ProfileRepository._();

  final ApiServices apiServices = ApiServices.instance;
  GetStorageServices getStorageServices = GetStorageServices.instance;

  Future<bool> updateUserProfile({
    String? name,
    String? businessInformation,
    String? personalInformation,
    String? licenseId,
    String? websiteLink,
    String? bio,
    String? contact,
    String? birthDate,
    String? image,
    double? latitude,
    double? longitude,
    bool? workExperience,
  }) async {
    try {
      // ✅ Dynamically add only non-empty fields
      final Map<String, dynamic> data = {};

      if (name != null && name.isNotEmpty) data["name"] = name;
      if (businessInformation != null && businessInformation.isNotEmpty) {
        data["businessInformation"] = businessInformation;
      }
      if (personalInformation != null && personalInformation.isNotEmpty) {
        data["personalInformation"] = personalInformation;
      }
      if (licenseId != null && licenseId.isNotEmpty) {
        data["licenseId"] = licenseId;
      }
      if (websiteLink != null && websiteLink.isNotEmpty) {
        data["websiteLink"] = websiteLink;
      }
      if (bio != null && bio.isNotEmpty) data["bio"] = bio;
      if (contact != null && contact.isNotEmpty) data["contact"] = contact;
      if (birthDate != null && birthDate.isNotEmpty) {
        data["birthDate"] = birthDate;
      }
      if (latitude != null) data["latitude"] = latitude;
      if (longitude != null) data["longitude"] = longitude;
      if (workExperience != null) data["workExperience"] = workExperience;

      // ✅ Create FormData
      final formData = FormData.fromMap(data);

      // ✅ Handle image only if valid path provided
      if (image != null && image.isNotEmpty) {
        try {
          final file = File(image);
          if (await file.exists()) {
            final fileName = file.path.split('/').last;
            final mimeType = lookupMimeType(file.path);

            formData.files.add(
              MapEntry(
                "image",
                await MultipartFile.fromFile(
                  file.path,
                  filename: fileName,
                  contentType: MediaType.parse(
                    mimeType ?? 'application/octet-stream',
                  ),
                ),
              ),
            );
          } else {
            AppPrint.appLog("⚠️ Image file does not exist at path: $image");
          }
        } catch (e) {
          AppPrint.appError("❌ Error processing image file: $e");
        }
      }

      // ✅ Send request
      final response = await apiServices.apiPatchServices(
        url: AppApiEndPoint.profileUpdate,
        body: formData,
      );

      if (response != null) {
        AppPrint.appLog("✅ Profile updated successfully");
        return true;
      } else {
        AppPrint.appLog("❌ Profile update failed: Response is null");
        return false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "updateUserProfile");
      return false;
    }
  }

  // Future<bool> updateUserProfile({
  //   String? name,
  //   String? businessInformation,
  //   String? personalInformation,
  //   String? licenseId,
  //   String? websiteLink,
  //   String? bio,
  //   String? contact,
  //   String? birthDate,
  //   String? image,
  //   double? latitude,
  //   double? longitude,
  //   bool workExperience = false,
  // }) async {
  //   try {
  //     FormData formDataMap = FormData.fromMap({
  //       "name": name,
  //       "businessInformation": businessInformation,
  //       "personalInformation": personalInformation,
  //       "licenseId": licenseId,
  //       "websiteLink": websiteLink,
  //       "bio": bio,
  //       "contact": contact,
  //       "birthDate": birthDate,
  //       "latitude": latitude,
  //       "longitude": longitude,
  //       "workExperience": workExperience,
  //     });

  //     if (image != null) {
  //       try {
  //         final file = File(image);
  //         if (await file.exists()) {
  //           String fileName = file.path.split('/').last;
  //           var mimeType = lookupMimeType(file.path);

  //           formDataMap.files.add(
  //             MapEntry(
  //               "image",
  //               await MultipartFile.fromFile(
  //                 file.path,
  //                 filename: fileName,
  //                 contentType: MediaType.parse(
  //                   mimeType ?? 'application/octet-stream',
  //                 ),
  //               ),
  //             ),
  //           );
  //         } else {
  //           AppPrint.appLog("Image file does not exist at path: $image");
  //         }
  //       } catch (e) {
  //         AppPrint.appError("Error processing image file: $e");
  //       }
  //     }

  //     var response = await apiServices.apiPatchServices(
  //       url: AppApiEndPoint.profileUpdate,
  //       body: formDataMap,
  //     );

  //     if (response != null) {
  //       AppPrint.appLog("✅ Profile updated successfully");
  //       return true;
  //     } else {
  //       AppPrint.appLog("❌ Profile update failed: Response is null");
  //       return false;
  //     }
  //   } catch (e) {
  //     AppPrint.appError(e, title: "updateUserProfile");
  //     return false;
  //   }
  // }

  Future<ProfileModelData?> getProfileData() async {
    try {
      AppPrint.appLog("🔄 Making API call to get profile data...");
      var response = await apiServices.apiGetServices(AppApiEndPoint.profile);

      AppPrint.appLog("📥 Raw API response: $response");

      if (response != null) {
        if (response["data"] != null && response["data"] is Map) {
          AppPrint.appLog("✅ Valid profile data found, parsing...");
          final profileData = ProfileModelData.fromJson(response["data"]);
          AppPrint.appLog("ð Parsed profile from API: ${profileData.role}");
          return profileData;
        } else {
          AppPrint.appLog("❌ Invalid data structure in response");
        }
      } else {
        AppPrint.appLog("❌ getProfileData response null");
        return null;
      }
    } catch (e) {
      AppPrint.appError(e, title: "getProfileData");
    }
    return null;
  }

  Future<bool> getRoleUidStoreInLocal() async {
    try {
      AppPrint.appLog("🔄 Making API call to get profile data...");
      var response = await apiServices.apiGetServices(AppApiEndPoint.profile);

      AppPrint.appLog("📥 Raw API response: $response");

      if (response != null) {
        if (response["data"] != null && response["data"] is Map) {
          getStorageServices.setUserRole(response["data"]["role"]);
          getStorageServices.setUID(response["data"]["_id"]);
          return true;
        } else {
          AppPrint.appLog("❌ Invalid data structure in response");
        }
      } else {
        AppPrint.appLog("❌ getProfileData response null");
        return false;
      }
    } catch (e) {
      AppPrint.appError(e, title: "getProfileData");
    }
    return false;
  }
}
