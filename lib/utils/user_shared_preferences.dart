import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static late SharedPreferences _preferences;

  //keys
  static const _keyUserUid = 'user_uid';
  static const _keyUserLogin = 'user_login';
  static const _keyUserGender = 'user_gender';
  static const _keyUserWeight = 'user_weight';
  static const _keyUserHeight = 'user_height';
  static const _keyUserAge = 'user_age';
  static const _keyUserPAL = 'user_pal';
  static const _keyLastLogIn = 'last_log_in';
  static const _keyStats = 'stats';

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //clear all shared preferences data
  static Future clearAllUserData() async => await _preferences.clear();

  //getters and setters

  //user_uid
  static Future setUserUID(String uid) async =>
      await _preferences.setString(_keyUserUid, uid);

  static String? getUserUID() => _preferences.getString(_keyUserUid);

  // user_login
  static Future setUserLogin(String login) async =>
      await _preferences.setString(_keyUserLogin, login);

  static String? getUserLogin() => _preferences.getString(_keyUserLogin);

  // user_gender    true - male, false - female
  static Future setUserGender(bool gender) async =>
      await _preferences.setBool(_keyUserGender, gender);

  static bool? getUserGender() => _preferences.getBool(_keyUserGender);

  // user_weight
  static Future setUserWeight(double weight) async =>
      await _preferences.setDouble(_keyUserWeight, weight);

  static double? getUserWeight() => _preferences.getDouble(_keyUserWeight);

  // user_height
  static Future setUserHeight(double height) async =>
      await _preferences.setDouble(_keyUserHeight, height);

  static double? getUserHeight() => _preferences.getDouble(_keyUserHeight);

  //user_age
  static Future setUserAge(int age) => _preferences.setInt(_keyUserAge, age);

  static int? getUserAge() => _preferences.getInt(_keyUserAge);

  // user_pal
  static Future setUserPAL(double pal) async =>
      _preferences.setDouble(_keyUserPAL, pal);

  static double? getUserPAL() => _preferences.getDouble(_keyUserPAL);

  // last loged in
  static Future setLastLoggedIn(int timeStamp) async =>
      _preferences.setInt(_keyLastLogIn, timeStamp);

  static int? getLastLoggedIn() => _preferences.getInt(_keyLastLogIn);

  //stats
  static Future setStats(List<String> stats) async =>
      _preferences.setStringList(_keyStats, stats);

  static List<String>? getStats() => _preferences.getStringList(_keyStats);
}
