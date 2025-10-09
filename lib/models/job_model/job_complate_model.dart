import 'dart:convert';

class JobComplateModel {
    bool? success;
    String? message;
    Pagination? pagination;
    List<JobComplateModelData>? data;

    JobComplateModel({
        this.success,
        this.message,
        this.pagination,
        this.data,
    });

    factory JobComplateModel.fromRawJson(String str) => JobComplateModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JobComplateModel.fromJson(Map<String, dynamic> json) => JobComplateModel(
        success: json["success"],
        message: json["message"],
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null ? [] : List<JobComplateModelData>.from(json["data"]!.map((x) => JobComplateModelData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "pagination": pagination?.toJson(),
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class JobComplateModelData {
    String? id;
    Employee? employee;
    Job? job;
    String? status;
    bool? isPaid;

    JobComplateModelData({
        this.id,
        this.employee,
        this.job,
        this.status,
        this.isPaid,
    });

    factory JobComplateModelData.fromRawJson(String str) => JobComplateModelData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory JobComplateModelData.fromJson(Map<String, dynamic> json) => JobComplateModelData(
        id: json["_id"],
        employee: json["employee"] == null ? null : Employee.fromJson(json["employee"]),
        job: json["job"] == null ? null : Job.fromJson(json["job"]),
        status: json["status"],
        isPaid: json["isPaid"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "employee": employee?.toJson(),
        "job": job?.toJson(),
        "status": status,
        "isPaid": isPaid,
    };
}

class Employee {
    String? id;
    String? name;
    String? email;
    DateTime? birthDate;
    String? gender;
    bool? workExperience;

    Employee({
        this.id,
        this.name,
        this.email,
        this.birthDate,
        this.gender,
        this.workExperience,
    });

    factory Employee.fromRawJson(String str) => Employee.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["_id"] != null && json["_id"] is String ? json["_id"] : "",
        name: json["name"] != null && json["name"] is String ? json["name"] : "",
        email: json["email"] != null && json["email"] is String ? json["email"] : "",
        birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]) ,
        gender: json["gender"] != null && json["gender"] is String ? json["gender"] : "",
        workExperience: json["workExperience"] != null && json["workExperience"] is bool ? json["workExperience"] : false,
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "birthDate": "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "workExperience": workExperience,
    };
}

class Job {
    String? id;
    String? title;
    String? qualification;
    String? jobImage;
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

    Job({
        this.id,
        this.title,
        this.qualification,
        this.jobImage,
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
    });

    factory Job.fromRawJson(String str) => Job.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"] != null && json["_id"] is String ? json["_id"] : "",
        title: json["title"] != null && json["title"] is String ? json["title"] : "",
        qualification: json["qualification"] != null && json["qualification"] is String ? json["qualification"] : "",
        jobImage: json["jobImage"] != null && json["jobImage"] is String ? json["jobImage"] : "",
        startDate: json["startDate"] != null && json["startDate"] is String ? json["startDate"] : ""  ,
        endDate: json["endDate"] != null && json["endDate"] is String ? json["endDate"] : ""  ,
        startTime: json["startTime"] != null && json["startTime"] is String ? json["startTime"] : "",
        endTime: json["endTime"] != null && json["endTime"] is String ? json["endTime"] : "",
        lat: json["lat"] != null && json["lat"] is double ? json["lat"] : 0.0,
        lng: json["lng"] != null && json["lng"] is double ? json["lng"] : 0.0,
        description: json["description"] != null && json["description"] is String ? json["description"] : "",
        ageGroup: json["ageGroup"] != null && json["ageGroup"] is String ? json["ageGroup"] : ""  ,
        status: json["status"] != null && json["status"] is String ? json["status"] : "",
        price: json["price"] != null && json["price"] is int ? json["price"] : 0,
        user: json["user"] != null && json["user"] is String ? json["user"] : "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "startDate": startDate,
        "qualification": qualification,
        "jobImage": jobImage,
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

    factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

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
