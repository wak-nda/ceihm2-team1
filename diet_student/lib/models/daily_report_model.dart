import 'package:flutter/material.dart';

class DailyReportModel {
  final int id;
  final int weight;
  final int calorie;
  final int proteine;
  final int glucide;
  final int lipide;
  final int userID;
  final String reportDate;

  DailyReportModel({
    @required this.id,
    this.weight,
    this.calorie,
    this.proteine,
    this.glucide,
    this.lipide,
    this.userID,
    this.reportDate
  })  : assert(id != null);

  DailyReportModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        weight = map["weight"],
        calorie = map["calorie"],
        proteine = map["proteine"],
        glucide = map["glucide"],
        lipide = map["lipide"],
        userID = map["userID"],
        reportDate = map["reportDate"];

  Map<String, dynamic> toMap() => {
    "id": id,
    "weight": weight,
    "calorie": calorie,
    "proteine": proteine,
    "glucide": glucide,
    "lipide": lipide,
    "userID": userID,
    "reportDate": reportDate
  };
}
