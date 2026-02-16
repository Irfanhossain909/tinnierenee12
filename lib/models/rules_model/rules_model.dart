import 'dart:convert';

class RulsModel {
    bool? success;
    String? message;
    RulesModelData? data;

    RulsModel({
        this.success,
        this.message,
        this.data,
    });

    factory RulsModel.fromRawJson(String str) => RulsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RulsModel.fromJson(Map<String, dynamic> json) => RulsModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : RulesModelData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class RulesModelData {
    String? id;
    String? type;
    int? v;
    String? content;

    RulesModelData({
        this.id,
        this.type,
        this.v,
        this.content,
    });

    factory RulesModelData.fromRawJson(String str) => RulesModelData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RulesModelData.fromJson(Map<String, dynamic> json) => RulesModelData(
        id: json["_id"],
        type: json["type"],
        v: json["__v"],
        content: json["content"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "type": type,
        "__v": v,
        "content": content,
    };
}
