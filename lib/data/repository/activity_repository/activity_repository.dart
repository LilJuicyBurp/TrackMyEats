import '/data/repository/activity_repository/base_activity_repository.dart';
import '/utils/user_shared_preferences.dart';

import '../../models/food_label_model.dart';

class ActivityRepository extends BaseActivityRepository {
  @override
  bool isNextDay() {
    final lastLoggedInEpoch = UserSharedPreferences.getLastLoggedIn();
    if (lastLoggedInEpoch != null) {
      final today = DateTime.now();
      final lastLoggedIn =
          DateTime.fromMillisecondsSinceEpoch(lastLoggedInEpoch);
      return today.difference(lastLoggedIn).inDays != 0;
    }
    updateDay();
    return false;
  }

  @override
  Future<void> updateDay() async {
    try {
      await UserSharedPreferences.setLastLoggedIn(
          DateTime.now().millisecondsSinceEpoch);
    } catch (error) {
      throw Exception(error);
    }
  }

  @override
  Future<void> updateStats(FoodLabel label) async {
    try {
      var stats = UserSharedPreferences.getStats();

      if (stats != null) {
        if (isNextDay()) {
          stats.removeLast();
          stats.insert(0, label.toJson());
        } else {
          FoodLabel todayStat = FoodLabel.fromJson(stats[0]);
          FoodLabel updatedStat = todayStat + label;
          stats[0] = updatedStat.toJson();
        }
      } else {
        stats = List.filled(
          7,
          super.nullStat,
        );
        stats[0] = label.toJson();
      }
      UserSharedPreferences.setStats(stats);
    } catch (error) {
      throw Exception(error);
    }
  }
}
