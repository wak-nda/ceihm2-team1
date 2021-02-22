import 'package:diet_student/mocks/food_mocks.dart';
import 'package:diet_student/models/food_model.dart';

bool manualEntry = false;
bool backScan = false;
bool typeBarcode = false;
bool scanNotFound = false;

List<FoodModel> foods = FOOD_MOCKS
    .map((model) => FoodModel.fromMap(model))
    .toList();