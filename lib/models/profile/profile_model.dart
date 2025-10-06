import 'dart:convert';

class ProfileModel {
    bool? success;
    String? message;
    ProfileModelData? data;

    ProfileModel({
        this.success,
        this.message,
        this.data,
    });

    factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : ProfileModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class ProfileModelData {
    String? id;
    String? name;
    String? role;
    String? email;
    bool? workExperience;
    String? image;
    bool? verified;
    bool? isActive;
    bool? isSubscribed;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;
    String? latitude;
    String? longitude;

    ProfileModelData({
        this.id,
        this.name,
        this.role,
        this.email,
        this.workExperience,
        this.image,
        this.verified,
        this.isActive,
        this.isSubscribed,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.latitude,
        this.longitude,
    });

    factory ProfileModelData.fromRawJson(String str) => ProfileModelData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProfileModelData.fromJson(Map<String, dynamic> json) => ProfileModelData(
        id: json["_id"],
        name: json["name"],
        role: json["role"],
        email: json["email"],
        workExperience: json["workExperience"],
        image: json["image"],
        verified: json["verified"],
        isActive: json["isActive"],
        isSubscribed: json["isSubscribed"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "role": role,
        "email": email,
        "workExperience": workExperience,
        "image": image,
        "verified": verified,
        "isActive": isActive,
        "isSubscribed": isSubscribed,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "latitude": latitude,
        "longitude": longitude,
    };
}
