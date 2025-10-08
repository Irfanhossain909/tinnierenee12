import 'dart:convert';

class JobModel {
  bool? success;
  String? message;
  Pagination? pagination;
  List<JobModelData>? data;

  JobModel({this.success, this.message, this.pagination, this.data});

  factory JobModel.fromRawJson(String str) =>
      JobModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
    success: json["success"],
    message: json["message"],
    pagination: json["pagination"] == null
        ? null
        : Pagination.fromJson(json["pagination"]),
    data: json["data"] == null
        ? []
        : List<JobModelData>.from(
            json["data"]!.map((x) => JobModelData.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "pagination": pagination?.toJson(),
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class JobModelData {
  Location? location;
  String? id;
  String? jobImage;
  String? title;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  double? lat;
  double? lng;
  String? description;
  String? qualification;
  String? ageGroup;
  String? status;
  int? price;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;

  JobModelData({
    this.location,
    this.id,
    this.jobImage,
    this.title,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.lat,
    this.lng,
    this.description,
    this.qualification,
    this.ageGroup,
    this.status,
    this.price,
    this.user,
    this.createdAt,
    this.updatedAt,
  });

  factory JobModelData.fromRawJson(String str) =>
      JobModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JobModelData.fromJson(Map<String, dynamic> json) => JobModelData(
    location: (json["location"] is Map<String, dynamic>)
        ? Location.fromJson(json["location"])
        : null,

    id: json["_id"] is String ? json["_id"] : "",

    title: json["title"] is String ? json["title"] : "",
    jobImage: json["jobImage"] is String ? json["jobImage"] : "",

    startDate: json["startDate"] is String ? json["startDate"] : "",

    endDate: json["endDate"] is String ? json["endDate"] : "",

    startTime: json["startTime"] is String ? json["startTime"] : "",

    endTime: json["endTime"] is String ? json["endTime"] : "",

    lat: json["lat"] is num ? (json["lat"] as num).toDouble() : 0.0,

    lng: json["lng"] is num ? (json["lng"] as num).toDouble() : 0.0,

    description: json["description"] is String ? json["description"] : "",

    qualification: json["qualification"] is String ? json["qualification"] : "",

    ageGroup: json["ageGroup"] is String ? json["ageGroup"] : "",

    status: json["status"] is String ? json["status"] : "",

    price: json["price"] is int ? json["price"] : 0,

    user: json["user"] is String ? json["user"] : "",

    createdAt: json["createdAt"] is String
        ? DateTime.tryParse(json["createdAt"]) ?? DateTime.now()
        : DateTime.now(),

    updatedAt: json["updatedAt"] is String
        ? DateTime.tryParse(json["updatedAt"]) ?? DateTime.now()
        : DateTime.now(),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "_id": id,
    "jobImage": jobImage,
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
    "status": status,
    "price": price,
    "user": user,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: json["coordinates"] == null
        ? []
        : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": coordinates == null
        ? []
        : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

class Pagination {
  int? total;
  int? limit;
  int? page;
  int? totalPage;

  Pagination({this.total, this.limit, this.page, this.totalPage});

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    total: json["total"],
    limit: json["limit"],
    page: json["page"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "limit": limit,
    "page": page,
    "totalPage": totalPage,
  };
}

// import 'dart:convert';

// class JobModel {
//   bool? success;
//   String? message;
//   Pagination? pagination;
//   List<JobModelData>? data;

//   JobModel({this.success, this.message, this.pagination, this.data});

//   factory JobModel.fromRawJson(String str) =>
//       JobModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory JobModel.fromJson(Map<String, dynamic> json) => JobModel(
//     success: json["success"],
//     message: json["message"],
//     pagination: json["pagination"] == null
//         ? null
//         : Pagination.fromJson(json["pagination"]),
//     data: json["data"] == null
//         ? []
//         : List<JobModelData>.from(
//             json["data"]!.map((x) => JobModelData.fromJson(x)),
//           ),
//   );

//   Map<String, dynamic> toJson() => {
//     "success": success,
//     "message": message,
//     "pagination": pagination?.toJson(),
//     "data": data == null
//         ? []
//         : List<dynamic>.from(data!.map((x) => x.toJson())),
//   };
// }

// class JobModelData {
//   Location? location;
//   String? id;
//   String? title;
//   DateTime? startDate;
//   DateTime? endDate;
//   String? startTime;
//   String? endTime;
//   double? lat;
//   double? lng;
//   String? description;
//   String? qualification;
//   String? ageGroup;
//   String? status;
//   int? price;
//   String? user;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   JobModelData({
//     this.location,
//     this.id,
//     this.title,
//     this.startDate,
//     this.endDate,
//     this.startTime,
//     this.endTime,
//     this.lat,
//     this.lng,
//     this.description,
//     this.qualification,
//     this.ageGroup,
//     this.status,
//     this.price,
//     this.user,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory JobModelData.fromRawJson(String str) =>
//       JobModelData.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory JobModelData.fromJson(Map<String, dynamic> json) => JobModelData(
//     location: (json["location"] is Map<String, dynamic>)
//         ? Location.fromJson(json["location"])
//         : null,

//     id: json["_id"] is String ? json["_id"] : "",

//     title: json["title"] is String ? json["title"] : "",

//     startDate: json["startDate"] is String
//         ? DateTime.tryParse(json["startDate"]) ?? DateTime.now()
//         : DateTime.now(),

//     endDate: json["endDate"] is String
//         ? DateTime.tryParse(json["endDate"]) ?? DateTime.now()
//         : DateTime.now(),

//     startTime: json["startTime"] is String ? json["startTime"] : "",

//     endTime: json["endTime"] is String ? json["endTime"] : "",

//     lat: json["lat"] is num ? (json["lat"] as num).toDouble() : 0.0,

//     lng: json["lng"] is num ? (json["lng"] as num).toDouble() : 0.0,

//     description: json["description"] is String ? json["description"] : "",

//     qualification: json["qualification"] is String ? json["qualification"] : "",

//     ageGroup: json["ageGroup"] is String ? json["ageGroup"] : "",

//     status: json["status"] is String ? json["status"] : "",

//     price: json["price"] is int ? json["price"] : 0,

//     user: json["user"] is String ? json["user"] : "",

//     createdAt: json["createdAt"] is String
//         ? DateTime.tryParse(json["createdAt"]) ?? DateTime.now()
//         : DateTime.now(),

//     updatedAt: json["updatedAt"] is String
//         ? DateTime.tryParse(json["updatedAt"]) ?? DateTime.now()
//         : DateTime.now(),
//   );

//   // factory JobModelData.fromJson(Map<String, dynamic> json) => JobModelData(
//   //     location: json["location"] == null ? null : Location.fromJson(json["location"]),
//   //     id: json["_id"],
//   //     title: json["title"],
//   //     startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
//   //     endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
//   //     startTime: json["startTime"],
//   //     endTime: json["endTime"],
//   //     lat: json["lat"]?.toDouble(),
//   //     lng: json["lng"]?.toDouble(),
//   //     description: json["description"],
//   //     qualification: json["qualification"],
//   //     ageGroup: json["ageGroup"],
//   //     status: json["status"],
//   //     price: json["price"],
//   //     user: json["user"],
//   //     createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//   //     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//   // );

//   Map<String, dynamic> toJson() => {
//     "location": location?.toJson(),
//     "_id": id,
//     "title": title,
//     "startDate":
//         "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
//     "endDate":
//         "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
//     "startTime": startTime,
//     "endTime": endTime,
//     "lat": lat,
//     "lng": lng,
//     "description": description,
//     "qualification": qualification,
//     "ageGroup": ageGroup,
//     "status": status,
//     "price": price,
//     "user": user,
//     "createdAt": createdAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//   };
// }

// class Location {
//   String? type;
//   List<double>? coordinates;

//   Location({this.type, this.coordinates});

//   factory Location.fromRawJson(String str) =>
//       Location.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//     type: json["type"],
//     coordinates: json["coordinates"] == null
//         ? []
//         : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
//   );

//   Map<String, dynamic> toJson() => {
//     "type": type,
//     "coordinates": coordinates == null
//         ? []
//         : List<dynamic>.from(coordinates!.map((x) => x)),
//   };
// }

// class Pagination {
//   int? total;
//   int? limit;
//   int? page;
//   int? totalPage;

//   Pagination({this.total, this.limit, this.page, this.totalPage});

//   factory Pagination.fromRawJson(String str) =>
//       Pagination.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//     total: json["total"],
//     limit: json["limit"],
//     page: json["page"],
//     totalPage: json["totalPage"],
//   );

//   Map<String, dynamic> toJson() => {
//     "total": total,
//     "limit": limit,
//     "page": page,
//     "totalPage": totalPage,
//   };
// }
