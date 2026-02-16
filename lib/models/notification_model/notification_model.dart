import 'dart:convert';

class NotificationsModel {
  bool? success;
  String? message;
  Pagination? pagination;
  List<NotificationModelData>? data;

  NotificationsModel({
    this.success,
    this.message,
    this.pagination,
    this.data,
  });

  factory NotificationsModel.fromRawJson(String str) =>
      NotificationsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
      NotificationsModel(
        success: json["success"],
        message: json["message"],
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
        data: json["data"] == null
            ? []
            : List<NotificationModelData>.from(
                json["data"]!.map((x) => NotificationModelData.fromJson(x))),
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

class NotificationModelData {
  String? id;
  String? text;
  String? title;
  String? receiver;
  String? referenceId;
  String? sender; // <- changed from Sender to String
  bool? read;
  DateTime? createdAt;
  DateTime? updatedAt;

  NotificationModelData({
    this.id,
    this.text,
    this.title,
    this.receiver,
    this.referenceId,
    this.sender,
    this.read,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationModelData.fromRawJson(String str) =>
      NotificationModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModelData.fromJson(Map<String, dynamic> json) =>
      NotificationModelData(
        id: json["_id"],
        text: json["text"],
        title: json["title"],
        receiver: json["receiver"],
        referenceId: json["referenceId"],
        sender: json["sender"], // <- simple String mapping
        read: json["read"],
        createdAt:
            json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt:
            json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "text": text,
        "title": title,
        "receiver": receiver,
        "referenceId": referenceId,
        "sender": sender,
        "read": read,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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

// class NotificationsModel {
//   bool? success;
//   String? message;
//   Pagination? pagination;
//   List<NotificationModelData>? data;

//   NotificationsModel({
//     this.success,
//     this.message,
//     this.pagination,
//     this.data,
//   });

//   factory NotificationsModel.fromRawJson(String str) =>
//       NotificationsModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory NotificationsModel.fromJson(Map<String, dynamic> json) =>
//       NotificationsModel(
//         success: json["success"],
//         message: json["message"],
//         pagination: json["pagination"] == null
//             ? null
//             : Pagination.fromJson(json["pagination"]),
//         data: json["data"] == null
//             ? []
//             : List<NotificationModelData>.from(json["data"]!.map((x) => NotificationModelData.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "pagination": pagination?.toJson(),
//         "data": data == null
//             ? []
//             : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class NotificationModelData {
//   String? id;
//   String? text;
//   String? title;
//   String? receiver;
//   String? referenceId;
//   Sender? sender;
//   bool? read;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   NotificationModelData({
//     this.id,
//     this.text,
//     this.title,
//     this.receiver,
//     this.referenceId,
//     this.sender,
//     this.read,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory NotificationModelData.fromRawJson(String str) => NotificationModelData.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory NotificationModelData.fromJson(Map<String, dynamic> json) => NotificationModelData(
//         id: json["_id"],
//         text: json["text"],
//         title: json["title"],
//         receiver: json["receiver"],
//         referenceId: json["referenceId"],
//         sender: json["sender"] == null ? null : Sender.fromJson(json["sender"]),
//         read: json["read"],
//         createdAt:
//             json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
//         updatedAt:
//             json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "text": text,
//         "title": title,
//         "receiver": receiver,
//         "referenceId": referenceId,
//         "sender": sender?.toJson(),
//         "read": read,
//         "createdAt": createdAt?.toIso8601String(),
//         "updatedAt": updatedAt?.toIso8601String(),
//       };
// }

// class Sender {
//   String? id;
//   String? name;
//   String? email;
//   String? image;

//   Sender({
//     this.id,
//     this.name,
//     this.email,
//     this.image,
//   });

//   factory Sender.fromRawJson(String str) => Sender.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Sender.fromJson(Map<String, dynamic> json) => Sender(
//         id: json["_id"],
//         name: json["name"],
//         email: json["email"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "email": email,
//         "image": image,
//       };
// }

// class Pagination {
//   int? total;
//   int? limit;
//   int? page;
//   int? totalPage;

//   Pagination({
//     this.total,
//     this.limit,
//     this.page,
//     this.totalPage,
//   });

//   factory Pagination.fromRawJson(String str) =>
//       Pagination.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         total: json["total"],
//         limit: json["limit"],
//         page: json["page"],
//         totalPage: json["totalPage"],
//       );

//   Map<String, dynamic> toJson() => {
//         "total": total,
//         "limit": limit,
//         "page": page,
//         "totalPage": totalPage,
//       };
// }
