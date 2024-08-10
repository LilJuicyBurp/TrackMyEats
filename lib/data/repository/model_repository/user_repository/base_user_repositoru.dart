import '/data/models/user_model.dart';

import '../../../models/food_label_model.dart';

abstract class BaseUserRepository {
  String nullStat = const FoodLabel(
    energy: 0,
    fat: 0,
    saturated: 0,
    protein: 0,
    salt: 0,
    sugar: 0,
    carbohydrates: 0,
  ).toJson();

  Stream<UserModel> getUser(String userUID);

  Future<void> initUserDocument(String userUID);

  Future<void> updateUserData(UserModel user);

  Future<void> initUserStats(String userUID);

  Future<void> updateUserStats(UserModel user);

  Stream<List<String>> getUserStats(String userUID);

  Future<void> saveUser(UserModel user);
}
