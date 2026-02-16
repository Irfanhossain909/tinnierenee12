import 'dart:convert';

class MyShiftModel {
  bool? success;
  String? message;
  Pagination? pagination;
  List<MyShiftModelData>? data;

  MyShiftModel({
    this.success,
    this.message,
    this.pagination,
    this.data,
  });

  factory MyShiftModel.fromRawJson(String str) =>
      MyShiftModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyShiftModel.fromJson(Map<String, dynamic> json) => MyShiftModel(
        success: json["success"] is bool ? json["success"] : false,
        message: json["message"] is String ? json["message"] : '',
        pagination: json["pagination"] is Map<String, dynamic>
            ? Pagination.fromJson(json["pagination"])
            : Pagination(),
        data: json["data"] is List
            ? List<MyShiftModelData>.from(
                json["data"].map((x) => MyShiftModelData.fromJson(x)),
              )
            : [],
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

class MyShiftModelData {
  String? id;
  Employee? employee;
  Job? job;
  String? status;
  bool? isPaid;
  int? totalDays;
  int? totalPrice;

  MyShiftModelData({
    this.id,
    this.employee,
    this.job,
    this.status,
    this.isPaid,
    this.totalDays,
    this.totalPrice,
  });

  factory MyShiftModelData.fromRawJson(String str) => MyShiftModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyShiftModelData.fromJson(Map<String, dynamic> json) => MyShiftModelData(
        id: json["_id"] is String ? json["_id"] : '',
        employee: json["employee"] is Map<String, dynamic>
            ? Employee.fromJson(json["employee"])
            : Employee(),
        job: json["job"] is Map<String, dynamic>
            ? Job.fromJson(json["job"])
            : Job(),
        status: json["status"] is String ? json["status"] : '',
        isPaid: json["isPaid"] is bool ? json["isPaid"] : false,
        totalDays: json["totalDays"] is int ? json["totalDays"] : 0,
        totalPrice: json["totalPrice"] is int ? json["totalPrice"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "employee": employee?.toJson(),
        "job": job?.toJson(),
        "status": status,
        "isPaid": isPaid,
        "totalDays": totalDays,
        "totalPrice": totalPrice,
      };
}

class Employee {
  String? id;
  String? name;
  String? email;
  String? image;

  Employee({
    this.id,
    this.name,
    this.email,
    this.image,
  });

  factory Employee.fromRawJson(String str) =>
      Employee.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["_id"] is String ? json["_id"] : '',
        name: json["name"] is String ? json["name"] : '',
        email: json["email"] is String ? json["email"] : '',
        image: json["image"] is String ? json["image"] : '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "image": image,
      };
}

class Job {
  String? id;
  String? title;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  double? lat;
  double? lng;
  String? description;
  String? ageGroup;
  String? status;
  int? price;
  String? user;
  String? address;
  String? jobImage;

  Job({
    this.id,
    this.title,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.lat,
    this.lng,
    this.description,
    this.ageGroup,
    this.status,
    this.price,
    this.user,
    this.address,
    this.jobImage,
  });

  factory Job.fromRawJson(String str) => Job.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"] is String ? json["_id"] : '',
        title: json["title"] is String ? json["title"] : '',
        startDate: json["startDate"] is String ? json["startDate"] : '',
        endDate: json["endDate"] is String ? json["endDate"] : '',
        startTime: json["startTime"] is String ? json["startTime"] : '',
        endTime: json["endTime"] is String ? json["endTime"] : '',
        lat: json["lat"] is num ? (json["lat"] as num).toDouble() : 0.0,
        lng: json["lng"] is num ? (json["lng"] as num).toDouble() : 0.0,
        description: json["description"] is String ? json["description"] : '',
        ageGroup: json["ageGroup"] is String ? json["ageGroup"] : '',
        status: json["status"] is String ? json["status"] : '',
        price: json["price"] is int ? json["price"] : 0,
        user: json["user"] is String ? json["user"] : '',
        address: json["address"] is String ? json["address"] : '',
        jobImage: json["jobImage"] is String ? json["jobImage"] : '',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "startDate": startDate,
        "endDate": endDate,
        "startTime": startTime,
        "endTime": endTime,
        "lat": lat,
        "lng": lng,
        "description": description,
        "ageGroup": ageGroup,
        "status": status,
        "price": price,
        "user": user,
        "address": address,
        "jobImage": jobImage,
      };
}

class Pagination {
  int? total;
  int? limit;
  int? page;
  int? totalPage;

  Pagination({
    this.total,
    this.limit,
    this.page,
    this.totalPage,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"] is int ? json["total"] : 0,
        limit: json["limit"] is int ? json["limit"] : 0,
        page: json["page"] is int ? json["page"] : 0,
        totalPage: json["totalPage"] is int ? json["totalPage"] : 0,
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "limit": limit,
        "page": page,
        "totalPage": totalPage,
      };
}
