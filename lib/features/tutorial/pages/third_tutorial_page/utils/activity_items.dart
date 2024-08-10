import '../../../../../data/models/activity_item.dart';

class ActivityItems {
  static const sitting = ActivityItem(
      lottiePath: "assets/lottie/sitting.json",
      label: "Sedentary lifestyle",
      value: 1.4);
  static const walking = ActivityItem(
      lottiePath: "assets/lottie/walking.json",
      label: "Not very active lifestyle",
      value: 1.5);
  static const running = ActivityItem(
      lottiePath: "assets/lottie/running.json",
      label: "Moderate physical activity",
      value: 1.7);
  static const active = ActivityItem(
      lottiePath: "assets/lottie/active.json",
      label: "Very active lifestyle",
      value: 2);

  static const List<ActivityItem> activities = [
    sitting,
    walking,
    running,
    active,
  ];
}
