import 'dart:convert';

class StatisticModel {
  bool? success;
  String? message;
  StatisticModelData? data;

  StatisticModel({this.success, this.message, this.data});

  factory StatisticModel.fromRawJson(String str) =>
      StatisticModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory StatisticModel.fromJson(Map<String, dynamic> json) => StatisticModel(
    success: json["success"],
    message: json["message"],
    data: json["data"] == null
        ? null
        : StatisticModelData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class StatisticModelData {
  int? totalSpent;
  int? pendingInvoices;
  int? runningShifts;
  int? totalShifts;

  StatisticModelData({
    this.totalSpent,
    this.pendingInvoices,
    this.runningShifts,
    this.totalShifts,
  });

  factory StatisticModelData.fromRawJson(String str) =>
      StatisticModelData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());
  factory StatisticModelData.fromJson(Map<String, dynamic> json) {
    return StatisticModelData(
      totalSpent: (json["totalSpent"] is int)
          ? json["totalSpent"]
          : int.tryParse(json["totalSpent"]?.toString() ?? '') ?? 0,

      pendingInvoices: (json["pendingInvoices"] is int)
          ? json["pendingInvoices"]
          : int.tryParse(json["pendingInvoices"]?.toString() ?? '') ?? 0,

      runningShifts: (json["runningShifts"] is int)
          ? json["runningShifts"]
          : int.tryParse(json["runningShifts"]?.toString() ?? '') ?? 0,

      totalShifts: (json["totalShifts"] is int)
          ? json["totalShifts"]
          : int.tryParse(json["totalShifts"]?.toString() ?? '') ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "totalSpent": totalSpent,
    "pendingInvoices": pendingInvoices,
    "runningShifts": runningShifts,
    "totalShifts": totalShifts,
  };
}
