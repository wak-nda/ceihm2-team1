import 'package:flutter/material.dart';

class FoodModel {
  final String id;
  final int kcal;
  final double protein;
  final double carbohydrates;
  final double lipids;
  final String name;
  final int idDaily;

  FoodModel({
    this.id,
    this.kcal,
    this.protein,
    this.carbohydrates,
    this.lipids,
    this.name,
    this.idDaily
  });

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

  @override
  String toString() {
    return "id: " + id + ", name: " + name + ", kcal: " + kcal.toString() + ", protein: " + protein.toString() + ", carbohydrates: " + carbohydrates.toString() + ", lipids: " + lipids.toString() + ", idDaily: " + idDaily.toString();
  }
}
