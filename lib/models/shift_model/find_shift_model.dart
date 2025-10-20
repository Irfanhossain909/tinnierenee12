import 'dart:convert';

class FindShiftModel {
  bool success;
  String message;
  Pagination pagination;
  List<FindShiftModelData> data;

  FindShiftModel({
    required this.success,
    required this.message,
    required this.pagination,
    required this.data,
  });

  factory FindShiftModel.fromRawJson(String str) =>
      FindShiftModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FindShiftModel.fromJson(Map<String, dynamic> json) {
    return FindShiftModel(
      success: json["success"] is bool ? json["success"] : false,
      message: json["message"] is String ? json["message"] : "",
      pagination: json["pagination"] is Map<String, dynamic>
          ? Pagination.fromJson(json["pagination"])
          : Pagination(),
      data: json["data"] is List
          ? List<FindShiftModelData>.from(
              json["data"].map((x) => FindShiftModelData.fromJson(x)),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "pagination": pagination.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FindShiftModelData {
  Location location;
  String id;
  String title;
  DateTime startDate;
  DateTime endDate;
  String startTime;
  String endTime;
  double lat;
  double lng;
  String description;
  String qualification;
  String ageGroup;
  String status;
  int price;
  String user;
  String? address;
  String? jobImage;
  DateTime createdAt;
  DateTime updatedAt;

  FindShiftModelData({
    required this.location,
    required this.id,
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.lat,
    required this.lng,
    required this.description,
    required this.qualification,
    required this.ageGroup,
    required this.status,
    required this.price,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    this.address,
    this.jobImage,
  });

  factory FindShiftModelData.fromRawJson(String str) => FindShiftModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FindShiftModelData.fromJson(Map<String, dynamic> json) {
    return FindShiftModelData(
      location: json["location"] is Map<String, dynamic>
          ? Location.fromJson(json["location"])
          : Location(),
      id: json["_id"] is String ? json["_id"] : "",
      title: json["title"] is String ? json["title"] : "",
      startDate: json["startDate"] is String
          ? DateTime.tryParse(json["startDate"]) ?? DateTime.now()
          : DateTime.now(),
      endDate: json["endDate"] is String
          ? DateTime.tryParse(json["endDate"]) ?? DateTime.now()
          : DateTime.now(),
      startTime: json["startTime"] is String ? json["startTime"] : "",
      endTime: json["endTime"] is String ? json["endTime"] : "",
      lat: json["lat"] is num ? (json["lat"] as num).toDouble() : 0.0,
      lng: json["lng"] is num ? (json["lng"] as num).toDouble() : 0.0,
      description: json["description"] is String ? json["description"] : "",
      qualification:
          json["qualification"] is String ? json["qualification"] : "",
      ageGroup: json["ageGroup"] is String && json["ageGroup"] != null ? json["ageGroup"] : "",
      status: json["status"] is String ? json["status"] : "",
      price: json["price"] is int ? json["price"] : 0,
      user: json["user"] is String ? json["user"] : "",
      createdAt: json["createdAt"] is String
          ? DateTime.tryParse(json["createdAt"]) ?? DateTime.now()
          : DateTime.now(),
      updatedAt: json["updatedAt"] is String
          ? DateTime.tryParse(json["updatedAt"]) ?? DateTime.now()
          : DateTime.now(),
      address: json["address"] is String ? json["address"] : "",
      jobImage: json["jobImage"] is String ? json["jobImage"] : "",
    );
  }

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "_id": id,
        "title": title,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "startTime": startTime,
        "endTime": endTime,
        "lat": lat,
        "lng": lng,
        "description": description,
        "qualification": qualification,
        "ageGroup": ageGroup,
        "status": status,
        "price": price,
        "user": user,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "address": address,
        "jobImage": jobImage,
      };
}

class Location {
  String type;
  List<double> coordinates;

  Location({
    this.type = "Point",
    this.coordinates = const [],
  });

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      type: json["type"] is String ? json["type"] : "Point",
      coordinates: json["coordinates"] is List
          ? List<double>.from(json["coordinates"]
              .map((x) => (x is num) ? x.toDouble() : 0.0))
          : [],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
      };
}

class Pagination {
  int total;
  int limit;
  int page;
  int totalPage;

  Pagination({
    this.total = 0,
    this.limit = 0,
    this.page = 0,
    this.totalPage = 0,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json["total"] is int ? json["total"] : 0,
      limit: json["limit"] is int ? json["limit"] : 0,
      page: json["page"] is int ? json["page"] : 0,
      totalPage: json["totalPage"] is int ? json["totalPage"] : 0,
    );
  }

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "page": page,
        "totalPage": totalPage,
      };
}
