import 'package:flutter/material.dart';

class FoodModel {
  final int id;
  final int kcal;
  final int protein;
  final int carbohydrates;
  final int lipids;
  final String name;
  final int idDaily;

  FoodModel({
    @required this.id,
    this.kcal,
    this.protein,
    this.carbohydrates,
    this.lipids,
    this.name,
    this.idDaily
  })  : assert(id != null);

  FoodModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        kcal = map["kcal"],
        protein = map["protein"],
        carbohydrates = map["carbohydrates"],
        lipids = map["lipids"],
        name = map["name"],
        idDaily = map["idDaily"];

  Map<String, dynamic> toMap() => {
    "id": id,
    "kcal": kcal,
    "protein": protein,
    "carbohydrates": carbohydrates,
    "lipids": lipids,
    "name": name,
    "idDaily": idDaily,
  };
}
