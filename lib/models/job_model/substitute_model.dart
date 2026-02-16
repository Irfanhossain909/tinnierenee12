class SubstituteModel {
  bool? success;
  String? message;
  Pagination? pagination;
  List<SubstituteModelData>? data;

  SubstituteModel({this.success, this.message, this.pagination, this.data});

  SubstituteModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      data = <SubstituteModelData>[];
      json['data'].forEach((v) {
        data!.add(SubstituteModelData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? total;
  int? limit;
  int? page;
  int? totalPage;

  Pagination({this.total, this.limit, this.page, this.totalPage});

  Pagination.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    totalPage = json['totalPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['limit'] = limit;
    data['page'] = page;
    data['totalPage'] = totalPage;
    return data;
  }
}

class SubstituteModelData {
  String? sId;
  String? title;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  double? lat;
  double? lng;
  Location? location;
  String? description;
  String? qualification;
  String? ageGroup;
  String? status;
  int? price;
  User? user;
  String? createdAt;
  String? updatedAt;
  int? applicantCount;

  SubstituteModelData(
      {this.sId,
      this.title,
      this.startDate,
      this.endDate,
      this.startTime,
      this.endTime,
      this.lat,
      this.lng,
      this.location,
      this.description,
      this.qualification,
      this.ageGroup,
      this.status,
      this.price,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.applicantCount});

  SubstituteModelData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    lat = json['lat'];
    lng = json['lng'];
    location = json['location'] != null
        ? Location.fromJson(json['location'])
        : null;
    description = json['description'];
    qualification = json['qualification'];
    ageGroup = json['ageGroup'];
    status = json['status'];
    price = json['price'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    applicantCount = json['applicantCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['lat'] = lat;
    data['lng'] = lng;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    data['description'] = description;
    data['qualification'] = qualification;
    data['ageGroup'] = ageGroup;
    data['status'] = status;
    data['price'] = price;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['applicantCount'] = applicantCount;
    return data;
  }
}

class Location {
  String? type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['coordinates'] = coordinates;
    return data;
  }
}

class User {
  String? sId;
  String? name;
  String? email;
  String? image;

  User({this.sId, this.name, this.email, this.image});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    return data;
  }
}
